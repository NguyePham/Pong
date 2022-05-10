#include "visible-object-manager.h"

namespace pong {

  VisibleObjectManager::~VisibleObjectManager() {
    auto itr = this->objects.begin();
    while (itr != this->objects.end()) {
      delete itr->second;
      ++itr;
    }
  }

  void VisibleObjectManager::addObject(std::string name, VisibleObject *object) {
    this->objects.insert(std::pair<std::string, VisibleObject *>(name, object));
  }

  void VisibleObjectManager::removeObject(std::string name) {
    auto results = this->objects.find(name);
    if (results != this->objects.end()) {
      delete results->second;
      this->objects.erase(results);
    }
  }

  VisibleObject *VisibleObjectManager::getObject(std::string name) {
    auto results = this->objects.find(name);
    if (results == this->objects.end()) {
      return NULL;
    }
    return results->second;
  }

  void VisibleObjectManager::handleInput(sf::Event &event) {
    auto itr = this->objects.begin();
    while (itr != this->objects.end()) {
      if (itr->first == "test") {
        ++itr;
        continue;
      }
      itr->second->handleInput(event);
      ++itr;
    }
  }

  void VisibleObjectManager::update(float timeElapsed)
  {
    auto itr = this->objects.begin();
    while (itr != this->objects.end()) {
      itr->second->update(timeElapsed);
      ++itr;
    }

    /// Process collision between objects.  
    auto originItr = this->objects.begin();
    while (originItr != this->objects.end()) {
      sf::Rect<float> originBound = originItr->second->getBoundingBox();

      auto targetItr = this->objects.begin();

      while (targetItr != this->objects.end()) {
        if (targetItr == originItr) {
          ++targetItr;
          continue;
        }
        sf::Rect<float> targetBound = targetItr->second->getBoundingBox();
        if (originBound.intersects(targetBound)) {
          originItr->second->collideWith(targetItr->second);
        }
        ++targetItr;
      }
      ++originItr;
    }
  }

  void VisibleObjectManager::draw() {
    auto itr = this->objects.begin();
    while (itr != this->objects.end()) {
      itr->second->draw();
      ++itr;
    }
  }
}
#run the application
run: bin/pong.exe
	bin/pong

#create the executable file
bin/pong.exe: obj/main.o obj/Game.o obj/state-manager.o obj/Game-state.o obj/splashScreen-state.o obj/Menu-state.o obj/one-player-state.o obj/two-player-state.o obj/visible-object-manager.o obj/visible-object.o obj/exit-button.o obj/one-player-button.o obj/two-player-button.o obj/field.o obj/ball.o obj/player.o
	g++ obj/main.o \
      obj/Game.o \
      obj/state-manager.o \
			obj/Game-state.o \
      obj/splashScreen-state.o \
			obj/Menu-state.o \
			obj/one-player-state.o \
			obj/two-player-state.o \
      obj/visible-object-manager.o \
      obj/visible-object.o \
      obj/exit-button.o \
      obj/one-player-button.o \
      obj/two-player-button.o \
			obj/field.o \
			obj/ball.o \
			obj/player.o \
  -o bin/pong.exe \
  -LD:/SFML-2.5.1/lib -lsfml-graphics -lsfml-window -lsfml-system -lsfml-network -lsfml-audio

#compile 'main'
obj/main.o: src/main.cpp
	g++ -c src/main.cpp -o obj/main.o -ID:/SFML-2.5.1/include -g

#compile 'Game'
obj/Game.o: src/Game.cpp src/Game.h src/DEFINITION.h
	g++ -c src/Game.cpp -o obj/Game.o -ID:/SFML-2.5.1/include -g

#update Game.h
src/Game.h: src/state/state-manager.h src/objects/visible-object-manager.h
	touch src/Game.h

#compile 'state-manager'
obj/state-manager.o: src/state/state-manager.cpp src/state/state-manager.h src/state/Game-state.h
	g++ -c src/state/state-manager.cpp -o obj/state-manager.o -ID:/SFML-2.5.1/include -g

#update state-manager.cpp
src/state/state-manager.cpp: src/state/splashScreen-state.h src/state/Menu-state.h src/state/one-player-state.h
	touch src/state/state-manager.cpp

#compile 'Game-state'
obj/Game-state.o: src/state/Game-state.cpp src/state/Game-state.h src/objects/visible-object-manager.h
	g++ -c src/state/Game-state.cpp -o obj/Game-state.o -ID:/SFML-2.5.1/include -g

#compile 'splashScreen-state'
obj/splashScreen-state.o: src/state/splashScreen-state.cpp src/state/splashScreen-state.h src/Game.h src/state/Game-state.h
	g++ -c src/state/splashScreen-state.cpp -o obj/splashScreen-state.o -ID:/SFML-2.5.1/include -g

#compile 'Menu-state'
obj/Menu-state.o: src/state/Menu-state.cpp src/state/Menu-state.h src/Game.h src/state/Game-state.h
	g++ -c src/state/Menu-state.cpp -o obj/Menu-state.o -ID:/SFML-2.5.1/include -g

#update Menu-state.cpp
src/state/Menu-state.cpp: src/objects/gui/exit-button.h src/objects/gui/one-player-button.h src/objects/gui/two-player-button.h 
	touch src/state/Menu-state.cpp

#compile 'one-player-state'
obj/one-player-state.o: src/state/one-player-state.cpp src/state/one-player-state.h src/Game.h src/state/Game-state.h
	g++ -c src/state/one-player-state.cpp -o obj/one-player-state.o -ID:/SFML-2.5.1/include -g

#update one-player-state.cpp
src/state/one-player-state.cpp: src/objects/gui/exit-button.h src/objects/gui/one-player-button.h src/objects/gui/two-player-button.h 
	touch src/state/one-player-state.cpp

#compile 'two-player-state'
obj/two-player-state.o: src/state/two-player-state.cpp src/state/two-player-state.h src/Game.h src/state/Game-state.h
	g++ -c src/state/two-player-state.cpp -o obj/two-player-state.o -ID:/SFML-2.5.1/include -g

#update two-player-state.cpp
src/state/two-player-state.cpp: src/objects/gui/exit-button.h src/objects/gui/two-player-button.h src/objects/gui/two-player-button.h 
	touch src/state/two-player-state.cpp

#compile 'visible-object-manager'
obj/visible-object-manager.o: src/objects/visible-object-manager.cpp src/objects/visible-object-manager.h src/objects/visible-object.h
	g++ -c src/objects/visible-object-manager.cpp -o obj/visible-object-manager.o -ID:/SFML-2.5.1/include -g

#compile 'visible-object'
obj/visible-object.o: src/objects/visible-object.cpp src/objects/visible-object.h src/Game.h
	g++ -c src/objects/visible-object.cpp -o obj/visible-object.o -ID:/SFML-2.5.1/include -g

#compile 'exit-button'
obj/exit-button.o: src/objects/gui/exit-button.cpp src/objects/gui/exit-button.h src/Game.h src/objects/visible-object-manager.h
	g++ -c src/objects/gui/exit-button.cpp -o obj/exit-button.o -ID:/SFML-2.5.1/include -g 

#compile 'one-player-button'
obj/one-player-button.o: src/objects/gui/one-player-button.cpp src/objects/gui/one-player-button.h src/Game.h src/objects/visible-object-manager.h
	g++ -c src/objects/gui/one-player-button.cpp -o obj/one-player-button.o -ID:/SFML-2.5.1/include -g 

#compile 'two-player-button'
obj/two-player-button.o: src/objects/gui/two-player-button.cpp src/objects/gui/two-player-button.h src/Game.h src/objects/visible-object-manager.h
	g++ -c src/objects/gui/two-player-button.cpp -o obj/two-player-button.o -ID:/SFML-2.5.1/include -g 

#compile 'field'
obj/field.o: src/objects/entities/field.cpp src/objects/entities/field.h src/Game.h src/objects/visible-object-manager.h
	g++ -c src/objects/entities/field.cpp -o obj/field.o -ID:/SFML-2.5.1/include -g 

#compile 'ball'
obj/ball.o: src/objects/entities/ball.cpp src/objects/entities/ball.h src/Game.h src/objects/visible-object-manager.h  src/DEFINITION.h
	g++ -c src/objects/entities/ball.cpp -o obj/ball.o -ID:/SFML-2.5.1/include -g 

#compile 'player'
obj/player.o: src/objects/entities/player.cpp src/objects/entities/player.h src/Game.h src/objects/visible-object-manager.h
	g++ -c src/objects/entities/player.cpp -o obj/player.o -ID:/SFML-2.5.1/include -g 

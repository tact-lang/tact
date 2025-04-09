struct Config {
  admin: Address;
  paused: Bool;
}

struct State {
  counter: Int;
  last_sender: Address?;
  config: Config;
}

contract TestContract {
  st: State;
  init() {
    self.st = State{
      counter: 0,
      last_sender: null,
      config: Config{admin: myAddress(), paused: false}
    };
  }
}
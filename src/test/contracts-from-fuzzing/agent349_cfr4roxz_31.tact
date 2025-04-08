// Compose contract with struct w/ optional boolean with default
struct DefOpt {
  flag: Bool? = null;
}

contract OptWithDefault {
  st: DefOpt;
  init() {
    self.st = DefOpt{};
  }
}
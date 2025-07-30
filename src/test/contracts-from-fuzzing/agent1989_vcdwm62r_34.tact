// test optional with default explicitly null
struct OptD {
  foo: Int? = null;
}

contract OptDefaultNull {
  st: OptD;

  init() {
    self.st = OptD{};
  }
}
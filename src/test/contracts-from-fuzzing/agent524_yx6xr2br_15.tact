struct HasDefaultOpt {
  a: Int? = null;
}

contract DefaultOptional {
  st: HasDefaultOpt;

  init() {
    self.st = HasDefaultOpt{};
  }
}
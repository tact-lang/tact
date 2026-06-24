struct Q {
  q: Int?;
}

struct R {
  r: Q?;
}

contract TestContract {
  s: R;

  init() {
    self.s = R{ r: Q{ q: null } };
  }
}
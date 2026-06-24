struct Final {
  extra: Cell as remaining;
}

struct Container {
  f: Final;
}

contract BadRemaining {
  c: Container;

  init() {
    self.c = Container{ f: Final{ extra: emptyCell() } };
  }
}
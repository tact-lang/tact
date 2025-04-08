struct Sfl {
  i: Int;
  b: Bool;
}

contract Arranged {
    f: Sfl;
    g: Int;
    h: Bool;

    init() {
        self.f = Sfl{ i: 3, b: false };
        self.g = 4;
        self.h = true;
    }
}
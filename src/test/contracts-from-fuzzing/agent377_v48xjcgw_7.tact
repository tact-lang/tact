struct Alpha {
  a: Int;
}

struct Beta {
  b: Bool;
}

contract TestContract {
    aa: Alpha;
    bb: Beta;
    cc: Int = 1;

    init() {
        self.aa = Alpha{ a: 10 };
        self.bb = Beta{ b: true };
        self.cc = 42;
    }
}
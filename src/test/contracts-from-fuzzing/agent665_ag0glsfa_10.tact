struct S {
  a: Int;
}

contract OrderTest {
    f1: Int = 1;
    f2: S = S{a: 2};
    f3: Int = 3;

    init() {
        self.f1 = 10;
        self.f2 = S{a:20};
        self.f3 = 30;
    }

    receive() {
        let _ = self.f1;
        let _ = self.f2;
        let _ = self.f3;
    }
}
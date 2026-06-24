struct Wrapper1 { v: Int; }
struct Wrapper2 { v: Bool; }

contract ManyWrappers {
    w1: Wrapper1;
    w2: Wrapper2;

    init() {
        self.w1 = Wrapper1{ v: 42 };
        self.w2 = Wrapper2{ v: true };
    }
}
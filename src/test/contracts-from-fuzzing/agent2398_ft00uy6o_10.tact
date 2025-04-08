struct S1 {
    f1: Int;
    f2: Bool?;
    f3: String;
}

struct S2 {
    inner1: S1;
    inner2: S1?;
}

contract TestContract {
    big: S2;

    init() {
        self.big = S2{
            inner1: S1{ f1: 1, f2: false, f3: "hi" },
            inner2: null
        };
    }
}
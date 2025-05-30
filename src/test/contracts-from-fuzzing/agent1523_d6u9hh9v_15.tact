struct BigNested {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
}

struct Wrapper {
    a: BigNested;
    b: BigNested;
    c: BigNested;
    d: BigNested;
}

contract Tester {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            a: BigNested{f1: 1, f2: true, f3: null, f4: false},
            b: BigNested{f1: 2, f2: false, f3: 3, f4: true},
            c: BigNested{f1: 4, f2: true, f3: null, f4: null},
            d: BigNested{f1: 5, f2: false, f3: 42, f4: false},
        };
    }
}
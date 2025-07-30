struct BoolLayer1 {
    f1: Bool;
    f2: Bool;
}

struct BoolLayer2 {
    inner: BoolLayer1;
    b: Bool;
}

struct BoolLayer3 {
    inner2: BoolLayer2;
    flag: Bool;
}

contract TestContract {
    data: BoolLayer3;

    init() {
        self.data = BoolLayer3{
            inner2: BoolLayer2{
                inner: BoolLayer1{f1: true, f2: false},
                b: true
            },
            flag: false
        };
    }
}
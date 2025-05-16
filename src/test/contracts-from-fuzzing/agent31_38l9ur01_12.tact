struct SInner {
    flag: Bool;
}

struct SOuter {
    inner1: SInner;
    inner2: SInner;
    message: String;
}

contract TestContract {
    data: SOuter;

    init() {
        self.data = SOuter{
            inner1: SInner{flag: true},
            inner2: SInner{flag: false},
            message: "Nested test",
        };
    }
}

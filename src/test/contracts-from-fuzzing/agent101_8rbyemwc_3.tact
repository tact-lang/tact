struct DeepNested {
    inner1: Int;
    inner2: Bool;
}

struct Wrapper {
    a: Int;
    b: DeepNested;
    c: String;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            a: 5,
            b: DeepNested{ inner1: 7, inner2: true },
            c: "x"
        };
    }
}
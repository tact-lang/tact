struct InnerNested {
    a: Int;
    b: Int;
}

struct MidNested {
    x: Int;
    inner: InnerNested;
    y: Int;
}

struct Wrapper {
    first: MidNested;
    second: MidNested;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            first: MidNested{x:1, inner:InnerNested{a:2,b:3}, y:4},
            second: MidNested{x:5, inner:InnerNested{a:6,b:7}, y:8}
        };
    }
}
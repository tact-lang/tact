struct DeepNested {
    x: Int;
    y: Bool;
}

struct MidNested {
    inner: DeepNested;
    flag: Bool;
}

struct Outer {
    mid: MidNested;
    value: Int;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: MidNested{
                inner: DeepNested{ x: 5, y: false },
                flag: true
            },
            value: 7
        };
    }
}
struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: DeepNested;
    flag: Bool;
}

struct Outer {
    m: Middle;
    num: Int;
}

contract DeepNestedContract {
    data: Outer;

    init() {
        self.data = Outer { m: Middle { inner: DeepNested { x: 5, y: true }, flag: false }, num: 10 };
    }
}
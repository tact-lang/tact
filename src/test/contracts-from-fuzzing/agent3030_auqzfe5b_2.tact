struct DeepInner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    x: Int;
    y: DeepInner;
    z: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: 5,
            y: DeepInner{ a:1, b:true, c:"abc" },
            z: false
        };
    }
}
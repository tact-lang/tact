struct DeepNested {
    e: Bool;
    f: Int;
}

struct Middle {
    c: DeepNested;
    d: Int;
}

struct Root {
    a: Middle;
    b: Bool;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            a: Middle{c: DeepNested{e: true, f: 99}, d: 5},
            b: false
        };
    }
}

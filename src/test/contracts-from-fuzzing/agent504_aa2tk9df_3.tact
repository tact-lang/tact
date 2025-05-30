struct L2 {
    a: Int;
    b: Bool;
}

struct L1 {
    foo: L2;
    bar: String;
}

contract DeepNested {
    deep: L1;

    init() {
        self.deep = L1{
            foo: L2{ a: 1, b: true },
            bar: "deep"
        };
    }
}
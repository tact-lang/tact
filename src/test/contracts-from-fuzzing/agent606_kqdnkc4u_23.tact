struct Leaf {
    x: Int;
    flag: Bool;
}

struct Mid {
    a: Leaf;
    y: String;
}

struct Root {
    inner: Mid;
}

contract Test {
    data: Root = Root{ inner: Mid{ a: Leaf{ x: 1, flag: true }, y: "aaa" } };
}
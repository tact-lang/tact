struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    nested: Inner;
    note: String;
}

contract TestContract {
    data: Outer = Outer{
        nested: Inner{ flag: true, count: 42 },
        note: "nested struct"
    };

    init() {}
}
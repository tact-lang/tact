struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    nested: Inner;
    text: String;
    flag: Bool;
}

contract TestStorage {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{a: 42, b: true},
            text: "hello",
            flag: false,
        };
    }
}
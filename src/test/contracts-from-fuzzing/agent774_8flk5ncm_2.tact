struct Nested {
    inner: InnerStruct;
    flag: Bool;
}

struct InnerStruct {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestStorage {
    state: Nested;
    init() {
        self.state = Nested{ inner: InnerStruct{ a: 10, b: "hi", c: true }, flag: false };
    }
}
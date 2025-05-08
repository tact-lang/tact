struct SubNested {
    foo: Int;
    bar: String;
}

struct Nested {
    a: SubNested;
    b: SubNested?;
    c: Int;
    d: Int?;
    e: String;
    f: String?;
}

contract Layered {
    item: Nested?;

    init() {
        self.item = null;
    }
}
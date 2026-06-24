// optional primitives with default null and nested struct persistent vars
struct Info {
    label: String?;
    count: Int;
}

contract Test {
    a: Int?;
    b: String?;
    c: Info;

    init() {
        self.a = null;
        self.b = null;
        self.c = Info{label: null, count: 5};
    }
}
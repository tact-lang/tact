struct OptWithNested {
    a: Int?;
    b: OptInner?;
}

struct OptInner {
    s: String?;
    b: Bool?;
}

contract NestedOptFields {
    s: OptWithNested;

    init() {
        self.s = OptWithNested{
            a:null,
            b:null,
        };
    }
}
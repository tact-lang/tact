struct OptionalNested {
    a: Int?;
    s: Inner?;
}

struct Inner {
    b: Int?;
    c: Bool?;
}

contract ComboOpt {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            a: null,
            s: Inner{ b: null, c: null }
        };
    }
}
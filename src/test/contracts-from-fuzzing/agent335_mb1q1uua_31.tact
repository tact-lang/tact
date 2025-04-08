struct OptionalNested {
    nest: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
}

contract OptionalNestedFields {
    data: OptionalNested;

    init() {
        self.data = OptionalNested {
            nest: Inner { a:null, b:null }
        };
    }
}
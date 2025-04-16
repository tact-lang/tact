struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    val: OptionalNested = OptionalNested{
        a: null,
        b: null,
        c: null,
        nested: null
    };

    init() {
        self.val = OptionalNested{
            a: 5,
            b: true,
            c: "hi",
            nested: Inner{x: 1, y: false, z: "z"}
        };
    }
}
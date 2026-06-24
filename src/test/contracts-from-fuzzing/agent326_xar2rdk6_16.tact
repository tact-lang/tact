struct NestedOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

struct OuterOptional {
    inner: NestedOptionalFields?;
    num: Int;
    yes: Bool;
}

contract NullableInNullable {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: null,
            num: 5,
            yes: true,
        };
    }

    receive() {
        self.data = self.data;
    }
}
struct InnerWithOptional {
    foo: Int?;
    bar: Bool?;
}

struct OuterMixed {
    directInt: Int;
    optStruct: InnerWithOptional?;
}

contract OptionalStructTest {
    data: OuterMixed;

    init() {
        self.data = OuterMixed{
            directInt: 42,
            optStruct: null
        };
    }
}

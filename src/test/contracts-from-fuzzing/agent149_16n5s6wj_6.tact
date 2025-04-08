struct OptDeep {
    inner: Int?;
    nested: StructInside?;
}

struct StructInside {
    flag: Bool;
    message: String;
}

contract OptionalNestedStructsTest {
    data: OptDeep;

    init() {
        self.data = OptDeep{
            inner: null,
            nested: StructInside{
                flag: true,
                message: "hi",
            },
        };
    }
}
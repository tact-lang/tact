struct OptionalNested {
    val: Int?;
    nested: Inner?;
}

struct Inner {
    message: String;
    flag: Bool;
}

contract OptionalInsideStruct {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            val: null,
            nested: null,
        };
    }
}
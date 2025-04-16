struct OptionalNestedStruct {
    nested: OptInside?;
}

struct OptInside {
    x: Int;
    y: String;
}

contract OptionalNestedInside {
    val: OptionalNestedStruct;

    init() {
        self.val = OptionalNestedStruct{
            nested: null
        };
    }
}

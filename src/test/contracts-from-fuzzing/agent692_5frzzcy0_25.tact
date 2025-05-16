struct OptionalStruct {
    point: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Int;
}

contract OptionalNested {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            point: null
        };
    }
}
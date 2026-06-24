struct OptStructField {
    val: Int?;
    nested: NestedStruct?;
}

struct NestedStruct {
    prop: String;
}

contract TestOptStructField {
    state: OptStructField;

    init() {
        self.state = OptStructField{
            val: null,
            nested: null
        };
    }
}

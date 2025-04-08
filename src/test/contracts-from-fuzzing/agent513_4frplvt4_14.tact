struct OptionalStruct {
    nested: Struct2?;
    val: Int;
}

struct Struct2 {
    s: String;
    b: Bool;
}

contract Test {
    field: OptionalStruct;
    init() {
        self.field = OptionalStruct{
            nested: null,
            val: 42
        };
    }
    receive() {}
}
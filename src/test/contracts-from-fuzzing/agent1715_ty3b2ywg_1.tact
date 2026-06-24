struct OptionalStruct {
    val: Int?;
    text: String?;
    nested: NestedStruct?;
}

struct NestedStruct {
    x: Int;
    flag: Bool;
}

contract TestContract {
    state: OptionalStruct = OptionalStruct{
        val: null,
        text: null,
        nested: null
    };
}
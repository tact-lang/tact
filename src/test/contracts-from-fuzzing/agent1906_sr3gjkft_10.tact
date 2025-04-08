struct StructA {
    field1: Int;
    field2: Bool;
    field3: String;
}

contract OnlyDefaults {
    data: StructA = StructA{
        field1: 1,
        field2: true,
        field3: "hi"
    };
}

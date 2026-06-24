struct NestedWithOptionals {
    label: String?;
    name: String;
    val: Int?;
    count: Int;
}

contract NestedAssignDefault {
    rec: NestedWithOptionals = NestedWithOptionals {
        label: null,
        name: "test",
        val: null,
        count: 0
    };
}
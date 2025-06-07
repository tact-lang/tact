struct NestedOptStruct {
    s: SubStruct?;
}

struct SubStruct {
    a: Int;
}

contract OptionalNull {
    val: NestedOptStruct = NestedOptStruct{ s: null };

    init() {}

    receive() {}
}
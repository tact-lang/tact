struct NestedWithOpt {
    x: Int;
    o: Bool?;
}

contract NestedOptDefault {
    val: NestedWithOpt = NestedWithOpt{
        x: 42,
        o: null
    };
}
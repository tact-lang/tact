struct NestedStruct {
    intVal: Int;
    nestedOpt: String?;
}

contract InlineInit {
    p: NestedStruct = NestedStruct{ intVal: 10, nestedOpt: null };
}
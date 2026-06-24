struct InitStruct {
    val: Int;
}

contract DefaultStructValue {
    data: InitStruct = InitStruct{ val: 42 };

    receive() {}
}

struct ArgStruct {
    value: Int;
}

struct ReturnStruct {
    res: Int;
}

contract TestGetterArgs {
    receive() {}

    get fun getWithArg(arg: Int, arg2: ArgStruct): ReturnStruct {
        return ReturnStruct { res: arg + arg2.value };
    }
}

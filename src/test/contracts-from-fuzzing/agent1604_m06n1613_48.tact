struct InnerInt {
    val: Int;
}

contract DefaultInStruct {
    x: InnerInt = InnerInt { val: 99 };
    receive() {}
}
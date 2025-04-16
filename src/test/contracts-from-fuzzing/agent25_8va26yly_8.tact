struct MyStruct {
    a: Int;
    b: Int;
}

fun test(): MyStruct {
    return MyStruct{a: 1, b: 2};
}

contract Test {
    receive() {
        test();
    }
}
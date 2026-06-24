struct MyStruct {
    value: Int;
}

fun getValueTwice(s: MyStruct): Int {
    return s.value + s.value;
}

contract TestFieldAccess {
    receive() {
        dump(getValueTwice(MyStruct { value: 21 })); // expecting 42
    }
}

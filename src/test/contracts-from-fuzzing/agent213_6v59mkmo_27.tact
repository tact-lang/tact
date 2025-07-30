struct MyStruct {
    inner: Int = 1;
    str: String = "abc";
}

contract C {
    s: MyStruct = MyStruct{};
}
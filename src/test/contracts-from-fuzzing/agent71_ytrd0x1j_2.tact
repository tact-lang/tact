struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStructGetter {
    receive() {}

    // Getter returning a struct instance
    get fun getStruct(): MyStruct {
        return MyStruct{a: 123, b: true};
    }
}

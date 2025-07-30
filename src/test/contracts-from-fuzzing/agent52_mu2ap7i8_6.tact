struct MyStruct {
    x: Int;
}

contract TestStructGetter {
    v: Int = 100;

    receive() {}

    // Getter returning a composite struct
    get fun getStruct(): MyStruct {
        return MyStruct { x: self.v };
    }
}

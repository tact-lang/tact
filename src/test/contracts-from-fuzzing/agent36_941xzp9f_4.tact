struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    ms: MyStruct = MyStruct { a: 1, b: true };

    receive() {}

    // Getter function returning a struct
    get fun getMS(): MyStruct {
        return self.ms;
    }
}

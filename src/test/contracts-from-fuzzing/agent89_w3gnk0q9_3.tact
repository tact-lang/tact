struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test2 {
    ms: MyStruct = MyStruct{ a: 10, b: true };

    receive() {}

    // Getter returning a struct
    get fun getStruct() : MyStruct {
        return self.ms;
    }
}

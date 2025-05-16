struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStruct {
    state: MyStruct = MyStruct{a: 10, b: true};
    
    receive() {}

    // Getter returning a struct
    get fun getState(): MyStruct {
        return self.state;
    }
}

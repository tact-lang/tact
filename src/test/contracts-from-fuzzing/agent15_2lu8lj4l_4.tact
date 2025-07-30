struct MyStruct {
    x: Int;
    y: Int;
}

contract TestGetterStruct2 {
    value: Int = 100;

    // Getter returning a struct
    get fun getStruct(): MyStruct {
        return MyStruct {
            x: self.value,
            y: self.value + 1
        };
    }

    // The receive function ensures the entire contract is compiled
    receive() {}
}

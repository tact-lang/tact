struct MyStruct {
    x: Int;
}

contract WithDefaultStructField {
    ms: MyStruct = MyStruct{x: 1};

    init() {
        self.ms = MyStruct{x: 2};
    }
}
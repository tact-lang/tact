struct MyStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: MyStruct = MyStruct{x: 10, y: true};

    init() {}
}
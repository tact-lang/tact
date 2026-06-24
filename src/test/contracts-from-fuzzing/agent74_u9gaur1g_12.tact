struct MyStruct {
    s: String;
}

contract TestContract {
    receive() {
        let ms: MyStruct = MyStruct { s: "Struct string test" };
        ms.s;
    }
}

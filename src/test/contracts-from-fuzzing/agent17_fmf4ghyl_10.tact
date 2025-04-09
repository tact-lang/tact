struct MyStruct {
    s: String;
}

contract Test {
    receive() {
        let ms: MyStruct = MyStruct { s: "Struct test: \t tab and \n newline" };
        dump(ms.s);
    }
}

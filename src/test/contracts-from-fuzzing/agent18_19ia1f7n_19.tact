struct MyStruct {
    s: String;
}

contract Test {
    receive() {
        // Instantiate a struct with a string field using the documented notation
        let ms: MyStruct = MyStruct{ s: "Hello Struct" };
        dump(ms.s); // Expected output: "Hello Struct"
    }
}

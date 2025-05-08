struct MyStruct {
    s: String;
}

fun testStruct(): Int {
    // Correct instantiation syntax: type name before the initializer block
    let ms: MyStruct = MyStruct { s: "StructTest" };
    return ms.s.hashData();
}

contract TestContract {
    receive() {
        dump(testStruct());
    }
}

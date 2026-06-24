struct MyStruct {
    s: String;
}

contract TestStructString {
    receive() {
        let a: MyStruct = MyStruct { s: "hello" };
        if (a.s == "hello") {
            // do nothing
        } else {
            // do nothing
        }
    }
}

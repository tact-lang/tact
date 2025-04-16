struct MyStruct {
    s: String;
}

contract Test {
    receive() {
        let x: MyStruct = MyStruct { s: "field test" };
        if (x.s == "field test") {
            x.s;
        } else {
            "error";
        }
    }
}

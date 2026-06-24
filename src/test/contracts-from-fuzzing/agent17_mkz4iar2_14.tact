struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let s: MyStruct = MyStruct{ a: 42, b: true };
        dump(s.toCell());
    }
}

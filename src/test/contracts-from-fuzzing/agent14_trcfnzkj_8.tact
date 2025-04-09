struct MyStruct {
    a: Int;
    b: Bool;
}

contract DebugTestDump2 {
    receive() {
        let s: MyStruct = MyStruct{
            a: 10,
            b: false,
        };
        // Convert struct to cell using extension toCell()
        dump(s.toCell());
    }
}

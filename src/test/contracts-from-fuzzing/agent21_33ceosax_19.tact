struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let s: MyStruct? = null;
        if (s != null) {
            let q = s!!;
            q.a;
        }
    }
}
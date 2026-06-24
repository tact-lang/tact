struct MyStruct {
    x: Int;
    y: Bool;
}

contract TestFieldAccess {
    receive() {
        let s: MyStruct = MyStruct { x: 10, y: true };
        let a = s.x;
        let b = s.y;
    }
}

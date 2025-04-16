struct TestStruct {
    x: Int;
    y: Int;
}

contract TestFieldAccess {
    receive() {
       let s: TestStruct = TestStruct { x: 42, y: 100 };
       dump(s.x);
       dump(s.y);
    }
}

struct TestStruct { x: Int }

contract TestFieldAccess {
    receive() {
        // Test field access and instantiation of struct
        let s: TestStruct = TestStruct { x: 42 };
        let v: Int = s.x;
    }
}

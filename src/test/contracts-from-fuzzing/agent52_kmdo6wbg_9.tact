struct MyStruct { x: Int }

contract FieldAccessTest {
    receive() {
        let s: MyStruct = MyStruct { x: 42 };
        dump(s.x);
    }
}

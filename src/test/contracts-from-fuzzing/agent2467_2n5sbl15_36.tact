struct MyStruct { val: Int as uint32; }

contract SerTest {
    s: MyStruct;
    init() {
        self.s = MyStruct{ val: 42 };
    }
}
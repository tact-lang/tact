struct MyStruct {
    a: Int = 11;
    b: Bool = true;
    c: String?; // implicit null
}

contract Test {
    data: MyStruct = MyStruct{
        a: 99,
        // b omitted: uses struct's default true
        // c omitted: uses implicit null
    };

    receive() {
        let _ = self.data.a + 1;
    }
}
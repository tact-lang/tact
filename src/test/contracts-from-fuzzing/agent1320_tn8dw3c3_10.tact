struct SerializeTest {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
}

contract SerializeContract {
    data: SerializeTest = SerializeTest{ a:1, b:2, c:true };

    receive() {
        self.data = SerializeTest{ a:255, b:-30000, c:false };
    }
}
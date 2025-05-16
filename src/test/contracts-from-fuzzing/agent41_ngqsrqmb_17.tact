struct SerializeBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract BoolSerializeTest {
    payload: SerializeBool;
    init() {
        self.payload = SerializeBool{
            a:true, b:false, c:true,d:false
        };
    }
}
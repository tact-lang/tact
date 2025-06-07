struct SerializeStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int64;
    d: Int as uint256;
}

contract SerializeStructContract {
    f: SerializeStruct = SerializeStruct{a:1,b:2,c:3,d:4};
    receive() {
        let _ = self.f.d;
    }
}
struct SerializeStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int256;
}

contract SerializeStructTest {
    s: SerializeStruct;
    init(){
        self.s = SerializeStruct{a:1, b:-1, c:42, d:-42};
    }
}
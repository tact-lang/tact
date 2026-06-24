struct SerializeStruct {
    a: Int as uint1;
    b: Int as int1;
    c: Int as uint8;
    d: Int as int8;
}

contract CSer {
    data: SerializeStruct;

    init() {
        self.data = SerializeStruct{a:1,b:1,c:100,d:100};
    }
}
struct SerStruct {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int128;
    e: Int as coins;
}

contract SerFields {
    s: SerStruct;

    init() {
        self.s = SerStruct{a:1,b:-5,c:100,d:-1,e:ton("1")};
    }
}
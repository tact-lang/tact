struct SerStruct {
    s1: Int as int8;
    s2: Int as uint4;
    s3: Int as int257;
}

contract StructSerialization {
    s: SerStruct;

    init() {
        self.s = SerStruct{
            s1: 127,
            s2: 15,
            s3: -1,
        };
    }
}
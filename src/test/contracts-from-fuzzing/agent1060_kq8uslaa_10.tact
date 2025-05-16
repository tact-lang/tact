struct SerialStruct {
    a: Int as uint4;
    b: Int as int8;
    c: Bool;
}

contract AnnotatedSerialization {
    data: SerialStruct;

    init() {
        self.data = SerialStruct{
            a: 5,
            b: -10,
            c: true
        };
    }
}
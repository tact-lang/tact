struct SerializeStruct {
    a: Int as uint4;
    b: Int as int12;
    c: Int;
}

contract SerializeStructContract {
    data: SerializeStruct;

    init() {
        self.data = SerializeStruct{
            a: 3,
            b: -7,
            c: 12345
        };
    }
}
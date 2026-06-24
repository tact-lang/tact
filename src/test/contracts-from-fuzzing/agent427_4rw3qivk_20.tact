struct StructWithString {
    msg: String;
    number: Int;
    flag: Bool;
}

contract PersistStringStruct {
    data: StructWithString;

    init() {
        self.data = StructWithString{
            msg: "hello",
            number: 55,
            flag: true
        };
    }
}
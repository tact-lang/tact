struct PlainStruct {
    a: Int;
    b: Bool;
    c: String;
}
contract PlainHolder {
    s: PlainStruct;
    init() {
        self.s = PlainStruct{
            a: 5,
            b: true,
            c: "struct"
        };
    }
}
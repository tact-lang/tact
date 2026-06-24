struct In {
    info: String;
}
struct Out {
    data: String;
}
contract StructsFlat {
    a: In;
    b: Out;

    init() {
        self.a = In{ info:"xx" };
        self.b = Out{ data:"yy" };
    }
}
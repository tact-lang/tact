struct SN1 {
    a: Int;
}
struct SN2 {
    b: Bool;
    c: SN1;
}
struct SN3 {
    x: String;
    y: SN2;
}

contract NestedManyStructs {
    data: SN3;

    init() {
        self.data = SN3{
            x: "x",
            y: SN2{
                b: true,
                c: SN1{ a: 37 }
            }
        };
    }
}

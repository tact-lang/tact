struct StructOne {
    x: Int;
}
struct StructTwo {
    y: Bool;
}
contract MultiStructFields {
    a: StructOne;
    b: StructTwo;
    init() {
        self.a = StructOne{ x: 10 };
        self.b = StructTwo{ y: false };
    }
}
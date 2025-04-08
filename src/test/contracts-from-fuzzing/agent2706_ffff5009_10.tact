struct StructA {
    x: Int;
}
struct StructB {
    y: Int;
}
contract ManyStructFields {
    a: StructA;
    b: StructB;

    init() {
        self.a = StructA{x: 11};
        self.b = StructB{y: 22};
    }
}
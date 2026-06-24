// Now test optional Cell with annotated field serialization
contract SerialOpt {
    a: Int?;
    b: Cell?;
    c: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
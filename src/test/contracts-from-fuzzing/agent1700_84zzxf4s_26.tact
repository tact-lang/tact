// mix int and bool optionals
contract MixOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 777;
        self.d = null;
    }
}

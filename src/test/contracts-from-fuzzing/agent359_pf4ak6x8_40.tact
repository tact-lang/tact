struct InnerBool {
    x: Bool;
}

contract ManyInnerBool {
    a: InnerBool;
    b: InnerBool;
    c: InnerBool;
    init() {
        self.a = InnerBool{ x: true };
        self.b = InnerBool{ x: false };
        self.c = InnerBool{ x: true };
    }
}
struct OptInt {
    x: Int?;
}

struct OptBool {
    y: Bool?;
}

struct OptStr {
    z: String?;
}

contract MultipleOptionals {
    a: OptInt;
    b: OptBool;
    c: OptStr;

    init() {
        self.a = OptInt{ x: null };
        self.b = OptBool{ y: true };
        self.c = OptStr{ z: null };
    }
}
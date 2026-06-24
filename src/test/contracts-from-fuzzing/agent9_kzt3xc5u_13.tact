struct DefaultsNested {
    a: Int = 2;
    b: Bool? = null;
    c: InnerD = InnerD{ val: true };
}

struct InnerD {
    val: Bool;
}

contract DefNested {
    x: DefaultsNested;

    init() {
        self.x = DefaultsNested{
            a: 123,
            b: true,
            c: InnerD{ val: false }
        };
    }
}
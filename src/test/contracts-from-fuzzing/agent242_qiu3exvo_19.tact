struct Mix {
    x: Int;
    y: Int?;
    b: Bool;
}

contract SuperMix {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    nested: Mix;
    const FOO: Int = 10;
    init() {
        self.c = null;
        self.d = null;
        self.nested = Mix{ x: 3, y: null, b: false };
    }
    get fun foo(): Int {
        return self.a + self.FOO;
    }
}
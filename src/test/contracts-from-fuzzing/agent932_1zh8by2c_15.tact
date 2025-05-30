// testing contract with many fields including optionals and nested structs
struct InnerA {
    x: Int;
    y: Bool;
    opt: String?;
}

struct B {
    inA: InnerA;
    flag: Bool;
    num: Int?;
}

contract WidePersistentStorage {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: InnerA;
    g: B;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = null;
        self.e = 10;
        self.f = InnerA{x: 5, y: false, opt: null};
        self.g = B{inA: self.f, flag: true, num: null};
    }
}

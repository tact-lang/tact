struct Combine1 {
    a: Int;
    b: Bool?;
    c: String;
}

struct Combine2 {
    x: String?;
    y: Bool;
}

contract ManyMixed {
    f1: Combine1;
    f2: Combine2;

    init() {
        self.f1 = Combine1{ a:1, b:null, c:"c" };
        self.f2 = Combine2{ x:null, y:true };
    }
}
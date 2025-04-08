struct S {
    i: Int;
    b: Bool;
    s: String;
}

contract ManyFieldsContract {
    f1: S;
    f2: S;
    f3: S;
    f4: S;

    init() {
        self.f1 = S{ i:1, b:true, s:"a" };
        self.f2 = S{ i:2, b:false, s:"b" };
        self.f3 = S{ i:3, b:true, s:"c" };
        self.f4 = S{ i:4, b:false, s:"d" };
    }
}
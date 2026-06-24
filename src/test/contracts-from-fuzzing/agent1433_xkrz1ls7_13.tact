struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: String;
    y: Address;
}

contract TestContract {
    s1: S1;
    s2: S2;
    init() {
        self.s1 = S1{ a:10, b:false };
        self.s2 = S2{ x:"hello", y:myAddress() };
    }
}
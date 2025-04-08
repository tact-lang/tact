struct S1 {
    x: Int;
    y: Bool;
    z: Address;
}

struct S2 {
    x: Bool;
    y: String;
    z: Int;
}

contract TwoStructs {
    a: S1;
    b: S2;

    init() {
        self.a = S1{ x:1, y:true, z:myAddress() };
        self.b = S2{ x:false, y:"string", z:42 };
    }
}

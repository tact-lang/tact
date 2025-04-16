struct S {
    z: Address?;
    y: Bool;
    x: Int;
}

contract FieldOrder2 {
    f: S;

    init() {
        self.f = S{ z:null, y:true, x:1 };
    }
}

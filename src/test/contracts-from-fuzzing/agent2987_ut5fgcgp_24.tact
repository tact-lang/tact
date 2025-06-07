struct S {
    x: Int;
    y: Bool;
    z: Address?;
}

contract FieldOrder1 {
    f: S;

    init() {
        self.f = S{ x:1, y:true, z:null };
    }
}

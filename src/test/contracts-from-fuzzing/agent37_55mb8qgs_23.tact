struct S {
    x: Int;
    y: Int?;
    z: Bool;
}

contract OptMiddleField {
    state: S;

    init() {
        self.state = S{ x:1, y:null, z:true };
    }
}

struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract Multi {
    x: S;
    y: S;
    z: S;

    init() {
        let v = S{a:1, b:true, c:"abc", d:myAddress()};
        self.x = v;
        self.y = v;
        self.z = v;
    }
}
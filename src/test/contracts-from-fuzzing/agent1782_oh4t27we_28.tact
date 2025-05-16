struct Compose {
    a: Int;
    b: Bool;
}

contract MultiAssign {
    x: Compose;
    y: Compose;
    z: Compose;

    init() {
        let c = Compose{ a:333, b:true };
        self.x = c;
        self.y = c;
        self.z = c;
    }
}
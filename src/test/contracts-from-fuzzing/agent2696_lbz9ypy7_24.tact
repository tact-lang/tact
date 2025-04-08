struct S {
    a: Int;
    b: Bool; 
    c: String; 
    d: Bool?;
    e: Int?;
}

contract MultiType {
    x: S?;
    y: Int?;
    z: String?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}
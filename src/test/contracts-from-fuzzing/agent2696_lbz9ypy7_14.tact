struct InnerA {
    x: Int;
    y: Bool;
}

struct MiddleB {
    a: InnerA;
    s: String;
    o: Bool?;
}

struct OutC {
    b: MiddleB;
    z: String?;
}

contract DeepOptional {
    q: OutC?;
    init() {
        self.q = null;
    }
}
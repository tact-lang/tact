struct Root {
    a: Int;
    b: Sub;
}

struct Sub {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalNested {
    root: Root;

    init() {
        self.root = Root{
            a: 10,
            b: Sub{ x: null, y: null, z: null }
        };
    }
}
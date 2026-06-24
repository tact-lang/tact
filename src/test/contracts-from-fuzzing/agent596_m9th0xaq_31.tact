struct Opa {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Opb {
    a: Opa?;
}

contract OptionalNestedToo {
    val: Opb;

    init() {
        self.val = Opb{
            a: Opa{ x: null, y: null, z: null }
        };
    }
}
struct Nest {
    n1: Int?;
    n2: Inner?;
}

struct Inner {
    x: Bool?;
    y: Address?;
    z: String?;
}

contract TestContract {
    nest: Nest;

    init() {
        self.nest = Nest {
            n1: null,
            n2: null
        };
    }
}
struct ManyLayers {
    a: Int;
    opt: Optionals;
}

struct Optionals {
    b: Int?;
    inner: Inner?
}

struct Inner {
    c: Int;
    d: Bool?;
    e: String?;
}

contract Test {
    layer: ManyLayers;

    init() {
        self.layer = ManyLayers{
            a: 1,
            opt: Optionals{
                b: null,
                inner: Inner{
                    c: 7,
                    d: true,
                    e: null
                }
            }
        };
    }
}
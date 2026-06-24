struct Layered {
    a: Int?;
    b: InnerLayer?;
}

struct InnerLayer {
    x: Int;
    y: Bool?;
    z: String?;
}

contract Test24 {
    l: Layered;

    init() {
        self.l = Layered{
            a: null,
            b: InnerLayer{
                x: 2,
                y: null,
                z: "hi"
            }
        };
    }
}
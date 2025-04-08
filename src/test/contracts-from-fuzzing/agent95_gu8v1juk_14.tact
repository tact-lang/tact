struct InnerMost {
    z: Int?;
}

struct MiddleOpt {
    y: Int?;
    im: InnerMost?; // optional nested struct
}

struct OuterOpt {
    x: Int?;
    m: MiddleOpt?; // optional nested
}

contract TestContract {
    data: OuterOpt?;

    init() {
        self.data = OuterOpt{
            x: 5,
            m: MiddleOpt{
                y: 10,
                im: InnerMost{ z: 20 }
            }
        };
    }
}
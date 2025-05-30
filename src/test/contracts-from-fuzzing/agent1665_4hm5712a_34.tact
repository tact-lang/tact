struct DeepOpts {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct MidOpts {
    inner: DeepOpts?;
}

struct TopOpts {
    up: MidOpts?;
}

contract Test34 {
    data: TopOpts;

    init() {
        self.data = TopOpts{
            up: MidOpts{
                inner: DeepOpts{
                    a: null,
                    b: null,
                    c: null
                }
            }
        };
    }
}
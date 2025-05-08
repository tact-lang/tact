struct InnerD {
    x: Int?;
    y: Bool?;
}

struct OuterD {
    a: InnerD?;
    b: Int;
}

contract DeepNulls {
    state: OuterD;

    init() {
        self.state = OuterD{
            a: InnerD{
                x: null,
                y: null
            },
            b: 1
        };
    }
}
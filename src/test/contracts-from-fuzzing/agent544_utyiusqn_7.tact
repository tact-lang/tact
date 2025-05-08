struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct OuterOpt {
    x: InnerOpt?;
    y: Bool?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            x: null,
            y: null,
        };
    }
}
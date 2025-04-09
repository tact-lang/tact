struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    a: InnerOpt?;
    b: Int?;
    s: String?;
}

contract ComplexOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            a: null,
            b: null,
            s: null
        };
    }

    receive() {
        let _ = self.data;
    }
}
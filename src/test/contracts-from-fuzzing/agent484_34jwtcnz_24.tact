// optional struct with optional fields
struct InnerOpt {
    x: Int?;
    y: String?;
}

contract OptOpt {
    f: InnerOpt?;

    init() {
        self.f = InnerOpt {
            x: null,
            y: null
        };
    }
}
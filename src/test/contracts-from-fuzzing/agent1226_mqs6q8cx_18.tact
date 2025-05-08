struct Alpha {
    x: Int?;
}

struct Beta {
    y: Int?;
    nested: Alpha?;
}

contract Test {
    beta: Beta;

    init() {
        self.beta = Beta{
            y: null,
            nested: null
        };
    }
}
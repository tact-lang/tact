struct Innermost {
    s: String?;
}

struct Middle {
    inn: Innermost?;
}

struct Outermost {
    mid: Middle?;
}

contract OptionalStringChain {
    root: Outermost;

    init() {
        self.root = Outermost {
            mid: null
        };
    }
}
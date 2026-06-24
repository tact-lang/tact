struct InnerOption {
    x: Int?
}

struct OuterOption {
    inr: InnerOption?
}

contract OptsDeeper {
    oo: OuterOption?;

    init() {
        self.oo = OuterOption {
            inr: InnerOption { x: null }
        };
    }
}
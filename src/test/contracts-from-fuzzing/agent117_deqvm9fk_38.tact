struct Rec {
    x: Int?;
}

struct Wrap {
    rec: Rec?;
}

contract DeeplyWrappedOpt {
    field: Wrap?;

    init() {
        self.field = Wrap{rec: Rec{x: 42}};
    }
}

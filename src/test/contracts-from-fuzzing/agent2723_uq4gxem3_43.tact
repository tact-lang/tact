struct Wrap {
    a: Int?;
}

contract DeepWrapOpt {
    w: Wrap?;
    init() {
        self.w = Wrap{ a: null };
    }
}
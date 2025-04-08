struct InnerOpt {
    s: String?;
}

contract DeepOptionals {
    x: InnerOpt?;

    init() {
        self.x = InnerOpt{ s: null };
    }
}
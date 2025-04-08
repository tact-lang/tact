struct OptionalLayer {
    n: InnerOpt?;
}

struct InnerOpt {
    m: Int;
    flag: Bool;
}

contract OptLayer {
    ol: OptionalLayer;

    init() {
        self.ol = OptionalLayer{ n:null };
    }
}
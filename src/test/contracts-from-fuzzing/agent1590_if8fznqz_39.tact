struct Nester {
    child: Int;
}

struct ParentOpt {
    kid: Nester?;
    info: String?;
}

contract OptionalParent {
    g: ParentOpt;

    init() {
        self.g = ParentOpt{
            kid: null,
            info: null
        };
    }
}
struct Rec {
    x: Int;
}

contract OptionalTopLevel {
    opt: Rec?;

    init() {
        self.opt = null;
    }
}
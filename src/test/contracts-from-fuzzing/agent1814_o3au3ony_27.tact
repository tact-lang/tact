struct Rec {
    opt: Int?;
}

contract OptionalStruct {
    s: Rec?;

    init() {
        self.s = null;
    }
}

struct OptionalNested {
    f: Nested?;
}
struct Nested {
    x: Int;
}

contract OptionalMember {
    opt: OptionalNested;
    init() {
        self.opt = OptionalNested{f:null};
    }
}

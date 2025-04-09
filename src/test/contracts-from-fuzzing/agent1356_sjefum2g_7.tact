struct Tiny {
    i: Int;
}

struct NestedOptional {
    opt: Tiny?;
}

contract NestedOptionalContract {
    rec: NestedOptional;

    init() {
        self.rec = NestedOptional{
            opt: null
        };
    }
}
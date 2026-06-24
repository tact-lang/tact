struct Str { s: String; }

struct WrapOpt {
    opt: Str?;
}

contract Test {
    field: WrapOpt;

    init() {
        self.field = WrapOpt{ opt: null };
    }
}
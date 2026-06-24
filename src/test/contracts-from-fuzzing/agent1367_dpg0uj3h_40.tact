struct InnerBool {
    b: Bool;
}

struct MaybeInnerBool {
    b: Bool?;
}

contract BoolMixContract {
    i: InnerBool;
    m: MaybeInnerBool;

    init() {
        self.i = InnerBool{ b: true };
        self.m = MaybeInnerBool{ b: null };
    }
}
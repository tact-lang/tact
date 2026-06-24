struct ComposeBoolStr {
    b: Bool;
    s: String;
}

struct ComposeInt {
    i: Int;
}

contract MultiStructs {
    fs1: ComposeBoolStr;
    fs2: ComposeInt;

    init() {
        self.fs1 = ComposeBoolStr{ b:true, s:"abc" };
        self.fs2 = ComposeInt{ i:42 };
    }
}
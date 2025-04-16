struct InnerMost {
    value: Int;
}

struct InnerOpt {
    nested: InnerMost?;
}

struct OuterOpt {
    deep: InnerOpt?;
}

contract Test9 {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ deep: null };
    }
}

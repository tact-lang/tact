struct DeepOpt {
    inner: Int?;
}

struct OuterOpt {
    deep: DeepOpt?;
}

contract NestedOptionals {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ deep: null };
    }
}
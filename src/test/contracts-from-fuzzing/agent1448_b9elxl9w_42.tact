struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost?;
}

struct Outer {
    deep: Inner?;
}

contract OptDeepClick {
    store: Outer;

    init() {
        self.store = Outer{ deep:null };
    }
}
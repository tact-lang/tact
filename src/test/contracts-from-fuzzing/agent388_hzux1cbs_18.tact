struct OptDeep3 {
    val: Int?;
}

struct OptDeep2 {
    inner: OptDeep3?;
}

struct OptDeep1 {
    inner: OptDeep2?;
}

contract DeepNestedOptionals {
    s: OptDeep1;
    init() {
        self.s = OptDeep1 { inner: null };
    }
}
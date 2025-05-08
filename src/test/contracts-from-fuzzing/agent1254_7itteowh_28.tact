struct DeepDefaultOptionals {
    a: Int? = null;
    inner: Inner? = null;
}

struct Inner {
    b: Int? = null;
}

contract DefaultsOptDeep {
    val: DeepDefaultOptionals;
    init() {
        self.val = DeepDefaultOptionals{};
    }
}
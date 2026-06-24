struct MixDefaults {
    foo: Int = 12;
    bar: Bool?;
    baz: Bool = true;
    qux: Int?;
}

contract TestContract {
    val: MixDefaults;

    init() {
        self.val = MixDefaults{ bar: null, qux: null };
    }
}
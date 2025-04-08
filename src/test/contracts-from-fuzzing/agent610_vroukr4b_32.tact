struct Inner {
    a: Int = 1;
    b: Bool = false;
    s: String = "";
}

contract ManyDefaults {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "abc";
    nested: Inner = Inner{};

    // No init() needed; all fields default initialized.
}
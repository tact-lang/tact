struct DefaultsAndOptionals {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract MixDefaultsOpt {
    val: DefaultsAndOptionals;

    init() {
        self.val = DefaultsAndOptionals{};
    }
}
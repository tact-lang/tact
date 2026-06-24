struct DefaultsAndOptionals {
    a: Int = 10;
    b: Bool? = null;
    s: String;
}

contract MixDefaultsOptionals {
    val: DefaultsAndOptionals;

    init() {
        self.val = DefaultsAndOptionals{
            s: "done"
        };
    }
}
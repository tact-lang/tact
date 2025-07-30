struct MixDefaultOpt {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: Int?;
}

contract MixedDefaultsOptionals {
    data: MixDefaultOpt;

    init() {
        self.data = MixDefaultOpt{
            e: 99
        };
    }
}

struct DefaultsOptionals {
    x: Int = 10;
    y: Int?;
    z: Bool = false;
}

contract DefaultsAndOpts {
    s: DefaultsOptionals;

    init() {
        self.s = DefaultsOptionals{
            y: null,
        };
    }
}
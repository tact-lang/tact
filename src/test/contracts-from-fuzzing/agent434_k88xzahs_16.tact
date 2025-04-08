struct DefaultsAndOptionals {
    i: Int = 42;
    s: String = "hello";
    b: Bool = true;
    optInt: Int?;
    optStr: String?;
}

contract TestContract {
    d: DefaultsAndOptionals;

    init() {
        self.d = DefaultsAndOptionals{
            optInt: null,
            optStr: null
        };
    }
}
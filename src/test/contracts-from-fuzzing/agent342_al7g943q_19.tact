struct DefaultBoolOptionals {
    a: Bool = true;
    b: Bool?;
    c: Bool? = false;
}

contract DefaultBoolOptionalsCtl {
    s: DefaultBoolOptionals;

    init() {
        self.s = DefaultBoolOptionals{
            b: null
        };
    }
}

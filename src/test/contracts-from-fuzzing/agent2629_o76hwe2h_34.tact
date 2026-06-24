struct DefaultsNested {
    n: Defaults;
    m: Defaults;
}

struct Defaults {
    a: Int = 1;
    b: Bool = false;
}

contract DefNested {
    val: DefaultsNested = DefaultsNested{
        n: Defaults{},
        m: Defaults{}
    };
    init() {}
}
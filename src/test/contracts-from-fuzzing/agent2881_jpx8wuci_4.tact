struct DefaultsNested {
    innerBool: Bool = true;
    innerInt: Int = 42;
}

struct DefaultsOuter {
    s: DefaultsNested;
    opt: Int?;
    flag: Bool = false;
}

contract DefaultsContract {
    value: DefaultsOuter;

    init() {
        self.value = DefaultsOuter{
            s: DefaultsNested{},
            opt: null,
            flag: true
        };
    }
}
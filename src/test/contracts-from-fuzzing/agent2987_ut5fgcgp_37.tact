struct DefaultsAndOptionals {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract DefaultsAndOptionalsContract {
    data: DefaultsAndOptionals;

    init() {
        self.data = DefaultsAndOptionals{
            b: null,
            d: null
        };
    }
}

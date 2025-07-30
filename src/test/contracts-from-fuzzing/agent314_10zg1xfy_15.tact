struct DefaultsAndOptionals {
    a: Int = 42;
    b: String?;
    c: Bool = true;
    d: Int?;
}

contract DefaultsAndOptionalsStorage {
    val: DefaultsAndOptionals;
    init() {
        self.val = DefaultsAndOptionals{
            b: null,
            d: null
        };
    }
}
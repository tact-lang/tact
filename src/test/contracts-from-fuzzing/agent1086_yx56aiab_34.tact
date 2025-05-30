struct DefaultsAndOptionals {
    a: Int?;
    b: Bool = false;
    c: Int = 0;
}

contract DefOptContract {
    data: DefaultsAndOptionals;

    init() {
        self.data = DefaultsAndOptionals{
            a: null,
            b: true,
            c: 5
        };
    }
}
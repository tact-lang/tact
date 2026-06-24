struct IntAndOptional {
    a: Int;
    b: Int?;
}

contract TestContract {
    storage: IntAndOptional;

    init() {
        self.storage = IntAndOptional{
            a: 10,
            b: null
        };
    }
}
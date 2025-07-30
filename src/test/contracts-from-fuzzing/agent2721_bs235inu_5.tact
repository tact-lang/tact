struct DefaultsMix {
    a: Int = 1;
    b: Bool;
    c: String = "hello";
    d: Bool = false;
}

contract DefaultedFieldsStorage {
    data: DefaultsMix;

    init() {
        self.data = DefaultsMix{
            b: true
        };
    }
}

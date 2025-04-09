struct DefaultOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: DefaultOptionals;
    init() {
        self.data = DefaultOptionals{
            a: null,
            b: true,
            c: null
        };
    }
}

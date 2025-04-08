struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyNullables {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{
            a: null,
            b: null,
            c: null
        };
    }
}
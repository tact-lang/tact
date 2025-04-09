struct DefaultAndOptional {
    a: Int = 1;
    b: Bool?;
    c: String = "hello";
    d: Int?;
}

contract DefaultOptContract {
    data: DefaultAndOptional;

    init() {
        self.data = DefaultAndOptional{
            b: true,
            d: null
        };
    }
}
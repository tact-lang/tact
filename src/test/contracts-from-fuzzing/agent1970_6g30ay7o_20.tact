struct Mix {
    a: Bool?;
    b: Int;
    c: String?;
}

contract MixedOptFields {
    data: Mix;

    init() {
        self.data = Mix{
            a: true,
            b: 99,
            c: null
        };
    }
}
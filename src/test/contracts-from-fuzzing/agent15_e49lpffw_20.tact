struct Mix {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract MixedFields {
    info: Mix;

    init() {
        self.info = Mix{
            a: 1, b: false, c: null, d: true
        };
    }
}
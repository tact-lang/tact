struct Optionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ManyNulls {
    data: Optionals;

    init() {
        self.data = Optionals{
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}
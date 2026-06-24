struct Mix {
    a: Int?;
    b: Bool;
    c: String = "default";
    d: Address?;
}

contract MixContract {
    m: Mix;
    init() {
        self.m = Mix{
            a: 5,
            b: true,
            d: null
        };
    }
}
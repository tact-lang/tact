struct OuterParam {
    inn: Int?;
}

struct MiddleParam {
    outer: OuterParam?;
}

contract MixNull {
    m: MiddleParam?;
    optInt: Int?;

    init() {
        self.m = MiddleParam{ outer: OuterParam{ inn: 123 } };
        self.optInt = 7;
    }
}
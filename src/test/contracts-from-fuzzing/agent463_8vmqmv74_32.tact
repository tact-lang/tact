struct Layer1 { d: Int; }

struct MixNest {
    sub: Layer1?;
    bigInt: Int as uint256;
    flag: Bool;
}

contract MixContract {
    data: MixNest;

    init() {
        self.data = MixNest{
            sub: null,
            bigInt: 1234567890,
            flag: true
        };
    }
}
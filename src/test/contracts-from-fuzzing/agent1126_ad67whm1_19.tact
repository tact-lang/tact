struct CombOptNest {
    f1: Int?;
    f2: Bool;
    f3: Int as uint8;
    f4: Bool?;
    f5: Int as int128;
    f6: Bool;
}

contract MixTypes {
    val: CombOptNest;
    init() {
        self.val = CombOptNest{
            f1: null,
            f2: false,
            f3: 100,
            f4: true,
            f5: -123456789,
            f6: true
        };
    }
}
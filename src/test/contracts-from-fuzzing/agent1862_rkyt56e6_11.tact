struct Mix {
    i1: Int as int32;
    i2: Int as uint32;
    bigInt: Int;
    coin: Int as coins;
    txt: String;
    flg: Bool;
}

contract MixTypes {
    mix: Mix;
    init() {
        self.mix = Mix{
            i1: -123,
            i2: 456,
            bigInt: 999999,
            coin: ton("1"),
            txt: "hello",
            flg: true
        };
    }
}
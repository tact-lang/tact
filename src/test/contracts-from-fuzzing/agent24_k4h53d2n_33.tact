struct SerializeMix {
    small: Int as int8;
    flags: Bool;
    text: String;
    coinsVal: Int as coins;
}

contract SerializeMixContract {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            small: -8,
            flags: true,
            text: "serialize",
            coinsVal:1000
        };
    }
}
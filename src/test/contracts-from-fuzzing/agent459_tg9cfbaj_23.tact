message(123) MixedMsg {
    a: Int as uint8;
    b: Int as int16;
    c: Int?;
    d: Bool?;
}

contract MessageMixStorage {
    data: MixedMsg = MixedMsg{ a: 1, b: -2, c: null, d: true };

    init() {
        self.data = MixedMsg{ a:255, b:32767, c:999, d:null };
    }
}
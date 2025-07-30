struct MixTypes {
    unsigned: Int as uint32;
    signed: Int as int16;
    flag: Bool;
    text: String;
}

contract Variety {
    sample: MixTypes;
    
    init() {
        self.sample = MixTypes{
            unsigned: 12345,
            signed: -123,
            flag: true,
            text: "test"
        };
    }
}
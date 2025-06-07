// Struct with mix of sizes, nested and optional fields focusing on serialization
struct SmallOpt {
    sv: Int?;
}

struct BigBigOpt {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as uint256;
    d: SmallOpt?;
}

contract SerializeMix {
    mixed: BigBigOpt;

    init() {
        self.mixed = BigBigOpt{
            a: 1,
            b: 12345,
            c: 67890,
            d: null
        };
    }
}

// Deliberately unset optional fields + defaults
struct MixUnset {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int = 5;
    e: Bool = true;
    f: String = "hi";
}

contract SkipNullDefaults {
    mm: MixUnset;

    init() {
        self.mm = MixUnset{};
    }
}
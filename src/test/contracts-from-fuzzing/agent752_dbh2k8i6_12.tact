struct ManyFields {
    f001: Int; f002: Int; f003: Int; f004: Int; f005: Int;
    f006: Int; f007: Int; f008: Int; f009: Int; f010: Int;
    f011: Int; f012: Int; f013: Int; f014: Int; f015: Int;
    f016: Int; f017: Int; f018: Int; f019: Int; f020: Int;
}

contract BigStructContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f001:1,f002:2,f003:3,f004:4,f005:5,
            f006:6,f007:7,f008:8,f009:9,f010:10,
            f011:11,f012:12,f013:13,f014:14,f015:15,
            f016:16,f017:17,f018:18,f019:19,f020:20
        };
    }
}
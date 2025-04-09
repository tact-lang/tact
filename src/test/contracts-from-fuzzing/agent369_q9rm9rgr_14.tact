struct ManyInts {
    f001: Int; f002: Int; f003: Int; f004: Int; f005: Int;
    f006: Int; f007: Int; f008: Int; f009: Int; f010: Int;
    f011: Int; f012: Int; f013: Int; f014: Int; f015: Int;
    f016: Int; f017: Int; f018: Int; f019: Int; f020: Int;
    f021: Int; f022: Int; f023: Int; f024: Int; f025: Int;
    f026: Int; f027: Int; f028: Int; f029: Int; f030: Int;
    f031: Int; f032: Int; f033: Int; f034: Int; f035: Int;
    f036: Int; f037: Int; f038: Int; f039: Int; f040: Int;
    f041: Int; f042: Int; f043: Int; f044: Int; f045: Int;
    f046: Int; f047: Int; f048: Int; f049: Int; f050: Int;
}

contract TestContract {
    ints: ManyInts;
    init() {
        self.ints = ManyInts{
            f001:1,f002:2,f003:3,f004:4,f005:5,
            f006:6,f007:7,f008:8,f009:9,f010:10,
            f011:11,f012:12,f013:13,f014:14,f015:15,
            f016:16,f017:17,f018:18,f019:19,f020:20,
            f021:21,f022:22,f023:23,f024:24,f025:25,
            f026:26,f027:27,f028:28,f029:29,f030:30,
            f031:31,f032:32,f033:33,f034:34,f035:35,
            f036:36,f037:37,f038:38,f039:39,f040:40,
            f041:41,f042:42,f043:43,f044:44,f045:45,
            f046:46,f047:47,f048:48,f049:49,f050:50
        };
    }
}
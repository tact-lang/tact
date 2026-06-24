// Conflicting serialization formats inside nested struct

struct InnerConf {
    a: Int as int8;
}

struct OuterConf {
    b: Int as int16;
    c: InnerConf;
}

contract Test51 {
    data: OuterConf;
    init() {
        self.data = OuterConf{
            b:10,
            c: InnerConf{a:5}
        };
    }
}
struct DeepOpts3 {
    e: Int? as uint32;
    f: Bool?;
}

struct DeepOpts2 {
    c: Int? as uint16;
    d: DeepOpts3?;
}

struct DeepOpts1 {
    a: Int? as uint8;
    b: DeepOpts2?;
}

contract DeepOptionalSer {
    nested: DeepOpts1;
    init() {
        self.nested = DeepOpts1{
            a:null,
            b: DeepOpts2{
                c:null,
                d: DeepOpts3{
                    e:null,
                    f:null
                }
            }
        };
    }
}

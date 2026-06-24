// Mix of optional fields with different serialization sizes
struct WeirdOpt {
    a: Int? as uint4;
    b: Int? as uint8;
    c: Int? as uint16;
    d: Int? as int32;
}

contract MixedSerializationOptionals {
    f: WeirdOpt;

    init() {
        self.f = WeirdOpt{a:null,b:null,c:null,d:null};
    }
}
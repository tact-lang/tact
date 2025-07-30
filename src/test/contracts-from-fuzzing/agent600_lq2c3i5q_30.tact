// test nested serialization specifier in struct with optional inner fields
struct InnerSer {
    a: Int? as uint8;
    b: Int? as int32;
}

contract OptSerNest {
    f: InnerSer;

    init() {
        self.f = InnerSer { a:null, b:null };
    }
}
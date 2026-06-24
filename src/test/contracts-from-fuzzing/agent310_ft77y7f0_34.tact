struct SerializeFields {
    a: Int as uint32;
    b: Int? as uint8;
    c: Bool?;
    d: String;
}

struct NestSer {
    s: SerializeFields?;
    v: Int as int64;
}

contract TestContract {
    val: NestSer;

    init() {
        self.val = NestSer{
            s: null,
            v: 12345678
        };
    }
}

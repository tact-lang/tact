struct MixSerials {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
    d: Bool;
    e: Bool?;
    f: Int?;
}

contract SerialTest {
    val: MixSerials;

    init() {
        self.val = MixSerials{
            a:255, b:-5000, c:777, d:true, e:null, f:null
        };
    }
}
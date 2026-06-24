// mixing serialization options
struct Mixed {
    a: Int as uint32;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int as int64;
}

contract MixedStorage {
    data: Mixed;

    init() {
        self.data = Mixed{
            a:1, b:true, c:null, d:null, e:123
        };
    }
}
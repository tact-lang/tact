struct NestedSerialize {
    x: Int as uint8;
    y: Int as int16;
    t: Bool;
}

struct OuterMixed {
    s: NestedSerialize;
    z: Int;
}

contract NestedSerializeContract {
    val: OuterMixed;

    init() {
        self.val = OuterMixed{
            s: NestedSerialize{x:255,y:-32768,t:true},
            z: 123456
        };
    }
}

struct InnerStr {
    val: Int as uint4; 
    flag: Bool; 
}

struct OuterStr {
    a: InnerStr; 
    b: Bool; 
    c: Int as int32;
}

contract MixSerNested {
    x: OuterStr;

    init() {
        self.x = OuterStr{
            a: InnerStr{ val: 10, flag: true },
            b: false,
            c: -1234,
        };
    }
}
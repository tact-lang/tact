// struct with many bool flags interleaved with other types
struct FlagsMix {
    f1: Bool;
    x: Int;
    f2: Bool;
    s: String;
    f3: Bool;
    y: Int;
    f4: Bool;
    z: String;
}

contract FlagsMixTest {
    data: FlagsMix;
    init() {
        self.data = FlagsMix{
            f1:true,
            x:1,
            f2:false,
            s:"abc",
            f3:true,
            y:2,
            f4:false,
            z:"def"
        };
    }
}
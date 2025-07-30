struct MixOpt {
    a: Int;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract MixedOptionTest {
    m: MixOpt = MixOpt{a:1};

    init() {
        self.m = MixOpt{
            a:10,
            b:20,
            c:true,
            d:true
        };
    }
}
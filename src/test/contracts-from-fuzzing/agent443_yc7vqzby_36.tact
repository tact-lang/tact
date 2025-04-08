struct LargeOptionalNested {
    s1: SmallOpt;
    s2: SmallOpt;
}

struct SmallOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DeepOptionTest {
    l: LargeOptionalNested;

    init() {
        self.l = LargeOptionalNested{
            s1: SmallOpt{ a:null, b:true, c:null },
            s2: SmallOpt{ a:123,  b:null, c:"xxx" }
        };
    }
}
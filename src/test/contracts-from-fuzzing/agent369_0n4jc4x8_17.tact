struct LargeOptionalNest {
    s1: Level1?;
    s2: Level1?;
    s3: Level1?;
    s4: Level1?;
}

struct Level1 {
    foo: Int;
    bar: Bool?;
}

contract LargeOptionalNestTest {
    val: LargeOptionalNest;

    init() {
        self.val = LargeOptionalNest{
            s1: Level1{foo:1,bar:null},
            s2: null,
            s3: Level1{foo:3,bar:true},
            s4: null,
        };
    }
}
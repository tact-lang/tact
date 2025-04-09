struct Level3 {
    foo: Int;
    bar: Bool;
}

struct Level2 {
    l3: Level3;
    optionalVal: Int?;
}

struct Level1 {
    l2: Level2;
    name: String;
}

contract NestedDepth {
    st: Level1;

    init() {
        self.st = Level1{
            l2: Level2{
                l3: Level3{ foo:42, bar:true },
                optionalVal: null
            },
            name: "abc"
        };
    }
}
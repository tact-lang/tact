struct Level2 {
    d1: Int;
    d2: String;
}

struct Level1 {
    b1: Bool;
    optLevel2: Level2?;
    number: Int;
}

struct RootStruct {
    s: String;
    nested: Level1;
    optNested: Level1?;
}

contract OptionalDeeper {
    root: RootStruct;

    init() {
        self.root = RootStruct{
            s: "root",
            nested: Level1{
                b1: true,
                optLevel2: Level2{d1:1,d2:"leaf"},
                number: 7
            },
            optNested: null
        };
    }
}
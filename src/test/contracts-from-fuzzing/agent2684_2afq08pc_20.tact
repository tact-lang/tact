struct Levels1 {
    a: Int;
    b: Int;
}

struct Levels2 {
    l1: Levels1;
    val: Int;
}

struct Levels3 {
    l2: Levels2;
    text: String;
}

contract DeepStruct {
    field: Levels3 = Levels3 {
        l2: Levels2{ l1: Levels1{a:1,b:2}, val:3 },
        text: "deep"
    };

    init() {
        self.field = Levels3 {
            l2: Levels2{ l1: Levels1{a:11,b:22}, val:33 },
            text: "deeper"
        };
    }
}

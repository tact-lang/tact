struct HasString {
    s: String;
}

struct HasBool {
    b: Bool;
}

struct HasIntOpt {
    i: Int?;
}

struct GiantStruct {
    h1: HasString;
    h2: HasBool;
    h3: HasIntOpt;
    flag: Bool?;
    txt: String?;
    num: Int;
}

contract Giant {
    data: GiantStruct;

    init() {
        self.data = GiantStruct{
            h1: HasString{ s: "x" },
            h2: HasBool{ b:true },
            h3: HasIntOpt{ i:null },
            flag: null,
            txt: "non-null",
            num: 777
        };
    }
}
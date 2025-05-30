struct Level3 {
    val3: Int;
}

struct Level2 {
    nested3: Level3;
    opt3: Int?;
    bool3: Bool;
    str3: String;
}

struct Level1 {
    nested2: Level2;
    opt2: String?;
    bool2: Bool;
    str2: String;
}

contract MultiNestedDeep {
    obj: Level1;

    init() {
        self.obj = Level1{
            nested2: Level2{
                nested3: Level3{
                    val3: 7
                },
                opt3: null,
                bool3: false,
                str3: ""
            },
            opt2: null,
            bool2: true,
            str2: "hi"
        };
    }
}
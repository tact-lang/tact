struct Mid {
    first: Int;
    second: String;
    opt: Bool?;
}

struct Top {
    id: Int;
    nested: Mid;
    flag: Bool;
}

contract TestFuzz {
    hold: Top;

    init() {
        self.hold = Top{
            id: 909,
            nested: Mid{first:512, second:"str", opt:null},
            flag: true
        };
    }
}
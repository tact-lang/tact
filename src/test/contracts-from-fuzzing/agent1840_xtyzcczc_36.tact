struct BigNested {
    a: Int;
    sub: SubNested;
}

struct SubNested {
    b: Int;
    last: LastNested;
}

struct LastNested {
    s: String;
    flag: Bool;
}

contract TestBN {
    f: BigNested;

    init() {
        self.f = BigNested{
            a:1,
            sub: SubNested{ b:2, last: LastNested{ s:"h", flag:true } }
        };
    }
}
struct SubA {
    a: Int;
}

struct SubB {
    b: Int;
}

struct HasSubs {
    sa: SubA;
    sb: SubB;
}

contract UsesSubs {
    field: HasSubs;

    init() {
        self.field = HasSubs{
            sa: SubA{ a: 5 },
            sb: SubB{ b: 10 }
        };
    }
}
struct Mid {
    i: Int;
    s: String;
}

contract ArrayLike {
    fst: Mid;
    snd: Mid;
    thd: Mid;

    init() {
        self.fst = Mid{i:1,s:"A"};
        self.snd = Mid{i:2,s:"B"};
        self.thd = Mid{i:3,s:"C"};
    }
}
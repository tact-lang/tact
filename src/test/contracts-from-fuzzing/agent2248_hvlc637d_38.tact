struct Sub {
    flag: Bool;
}

struct Top {
    s: Sub;
    comment: String;
}

contract EmbedSimple {
    t: Top;

    init() {
        self.t = Top{ s: Sub{flag:true}, comment:"hop" };
    }
}
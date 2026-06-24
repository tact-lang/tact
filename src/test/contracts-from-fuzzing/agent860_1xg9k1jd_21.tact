struct Embed {
    i: Int;
    b: Bool;
}

struct Outer {
    f1: Embed;
    f2: Embed;
    optF: Embed?;
}

contract MultiEmbed {
    s: Outer;

    init() {
        self.s = Outer{ f1: Embed{i:1,b:true}, f2: Embed{i:2,b:false}, optF: null };
    }
}
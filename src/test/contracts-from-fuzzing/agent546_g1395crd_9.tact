struct Mid1 { a: Int; }
struct Mid2 { b: Bool; }
struct Mid3 { c: String; }

struct Compose {
    s1: Mid1;
    s2: Mid2;
    s3: Mid3;
}

contract EmbedCompose {
    cmp: Compose;

    init() {
        self.cmp = Compose{
            s1: Mid1{a:5},
            s2: Mid2{b:true},
            s3: Mid3{c:"hi"}
        };
    }
}

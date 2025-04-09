struct S1 { a: Int }

struct S2 { b: Int }

struct Embed {
    one: S1;
    two: S2;
}

contract EmbedContract {
    data: Embed;
    init() {
        self.data = Embed{
            one: S1{a:10},
            two: S2{b:20}
        };
    }
}
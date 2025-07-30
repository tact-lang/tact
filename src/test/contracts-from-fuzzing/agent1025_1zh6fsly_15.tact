struct MultiEmbedded {
    one: Inner1;
    two: Inner2;
    three: Inner3;
}

struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }

contract EmbedContract {
    me: MultiEmbedded;

    init() {
        self.me = MultiEmbedded{
            one: Inner1{ a: 1 },
            two: Inner2{ b: true },
            three: Inner3{ c: "yo" }
        };
    }
}

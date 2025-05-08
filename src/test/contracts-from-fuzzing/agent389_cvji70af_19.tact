struct Inner1 { a: Int }
struct Inner2 { b: Bool }
struct Both {
    x: Inner1;
    y: Inner2;
}

contract EmbedBoth {
    f: Both;

    init() {
        self.f = Both{
            x: Inner1{ a:5 },
            y: Inner2{ b:true }
        };
    }
}
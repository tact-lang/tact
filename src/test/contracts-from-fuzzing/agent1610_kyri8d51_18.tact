struct EmbedA { a: Int; }
struct EmbedB { b: Int; }
struct Container {
    a: EmbedA;
    b: EmbedB;
}

contract EmbedTest {
    data: Container;
    init() {
        self.data = Container{
            a: EmbedA{ a: 1 },
            b: EmbedB{ b: 2 },
        };
    }
}
struct A {
    v: Bool;
}

struct B {
    x: Int;
    embedded: A;
}

contract EmbedTest {
    emb: B;

    init() {
        self.emb = B{ x: 123, embedded: A{ v: true } };
    }
}
struct StructA {
    valA: Int;
}

struct StructB {
    valB: Int;
}

struct MultiEmbed {
    sa: StructA;
    sb: StructB;
}

contract MultiEmbeddedTest {
    data: MultiEmbed;

    init() {
        self.data = MultiEmbed{
            sa: StructA{valA: 11},
            sb: StructB{valB: 22}
        };
    }
}
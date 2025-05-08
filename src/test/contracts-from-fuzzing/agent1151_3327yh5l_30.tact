struct Embedding {
    p: Int?;
    q: Bool;
}

struct Aggregator {
    a: Embedding;
    b: String;
}

contract NestedParameter(
    ag: Aggregator
) {
    receive() {
        dump(self.ag.b);
    }
}
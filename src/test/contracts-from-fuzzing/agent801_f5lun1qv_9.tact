struct InnerEmbedding {
    x: Int;
    y: Int?;
}

struct OuterEmbedding {
    in1: InnerEmbedding;
    in2: InnerEmbedding;
}

contract EmbeddedStructsContract {
    bigfield: OuterEmbedding;

    init() {
        self.bigfield = OuterEmbedding{
            in1: InnerEmbedding{ x: 10, y: null },
            in2: InnerEmbedding{ x: 20, y: 30 }
        };
    }
}
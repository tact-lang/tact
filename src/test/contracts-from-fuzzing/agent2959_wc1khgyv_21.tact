struct D {
    x: Int?;
}

struct E {
    d: D?;
}

struct F {
    e: E?;
}

contract DeepSparseNullable {
    state: F;

    init() {
        self.state = F{
            e: null
        };
    }
}
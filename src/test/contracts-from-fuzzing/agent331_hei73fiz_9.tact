struct Inner {
    s: String;
}

struct Mid {
    i: Inner;
}

contract MultiLayerField {
    m: Mid;

    init() {
        self.m = Mid{
            i: Inner{s:"hello"},
        };
    }
}
struct InnerMost {
    data: Int;
}

struct Middle {
    item: InnerMost?;
}

contract OptinOpt {
    data: Middle;

    init() {
        self.data = Middle{ item: null };
    }
}
struct In {
    v: Int;
}

struct Out {
    wrapped: In;
}

contract TestWrap {
    item: Out;

    init() {
        self.item = Out{
            wrapped: In{ v: 100 }
        };
    }
}
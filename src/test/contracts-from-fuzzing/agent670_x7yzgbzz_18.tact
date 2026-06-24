struct RecA { val: Int }
struct RecB { val: Int }

struct RecWrap {
    a: RecA;
    b: RecB;
}

contract MultipleWraps {
    data: RecWrap;

    init() {
        self.data = RecWrap{
            a: RecA{ val: 1 },
            b: RecB{ val: 2 },
        };
    }
}
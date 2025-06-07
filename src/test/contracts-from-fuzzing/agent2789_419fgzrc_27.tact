struct OptWrap {
    val: Int?;
}

struct TripleWrap {
    wrap1: OptWrap;
    wrap2: OptWrap;
    wrap3: OptWrap;
}

contract MultiOptWrapTest {
    multi: TripleWrap;

    init() {
        self.multi = TripleWrap{
            wrap1: OptWrap{val: null},
            wrap2: OptWrap{val: 1},
            wrap3: OptWrap{val: null}
        };
    }
}

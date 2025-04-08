struct InnerBool {
    b: Bool;
}

struct MidWrap {
    i: InnerBool;
}

contract NestedBoolTest {
    data: MidWrap;
    init() {
        self.data = MidWrap{
            i: InnerBool{ b: true }
        };
    }
}
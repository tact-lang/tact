struct SubInner {
    id: Int;
}

struct InnerWrap {
    inner: SubInner;
}

struct OuterWrap {
    middle: InnerWrap;
}

contract MultipleLayers {
    val: OuterWrap;

    init() {
        self.val = OuterWrap{
            middle: InnerWrap{
                inner: SubInner{ id:77 }
            }
        };
    }
}
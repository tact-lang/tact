struct Wrap {
 a: InnerWrap;
}

struct InnerWrap {
 val: Int?;
}

contract WrapDefaults {
 w: Wrap = Wrap{a: InnerWrap{val: null}};
}

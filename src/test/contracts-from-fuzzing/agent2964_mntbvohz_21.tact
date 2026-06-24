struct SInner {
    text: String;
}

struct SWrap {
    s: SInner;
}

contract InitDefaultWrap {
    f: SWrap = SWrap{s: SInner{text: "hi"}};
}
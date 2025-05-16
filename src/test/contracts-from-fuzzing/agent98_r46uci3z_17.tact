struct Wrap {
    inner: InnerWrap;
}

struct InnerWrap {
    flag: Bool;
    data: String;
}

contract OptWrapTest {
    w: Wrap?;
    
    init() {
        self.w = null;
    }
}
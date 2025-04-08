struct InnerMost {
    z: Int;
}

struct OneMore {
    inner: InnerMost;
}

struct TopMost {
    m: OneMore;
    flag: Bool;
}

contract DeepCorrect {
    top: TopMost;

    init() {
        self.top = TopMost{ m: OneMore{ inner: InnerMost{ z:5 } }, flag:true};
    }
}
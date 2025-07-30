struct InnerMost {
    f: Bool;
}

struct MiddleN {
    i: Int;
    inn: InnerMost;
}

struct TopN {
    m: MiddleN;
    s: String;
}

contract DeepStructChain {
    val: TopN;
    init() {
        self.val = TopN{ m: MiddleN{i:0, inn:InnerMost{f:true}}, s:"abc" };
    }
}
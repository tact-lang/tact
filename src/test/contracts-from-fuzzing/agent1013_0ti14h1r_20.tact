struct InnerMost { flag: Bool; }

struct Mid {
    value: Int;
    inner: InnerMost;
}

struct OuterMost {
    mid: Mid;
    label: String;
    another: Int?;
}

contract OptDeepCombo {
    state: OuterMost;

    init() {
        self.state = OuterMost{ mid:Mid{value:1, inner:InnerMost{flag:true}}, label:"L", another:null };
    }
}

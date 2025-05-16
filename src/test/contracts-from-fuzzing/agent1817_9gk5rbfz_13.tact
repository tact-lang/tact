struct InnerMost {
    i: Int;
    s: String;
}

struct MidLevel {
    inner: InnerMost;
    flag: Bool;
}

struct TopLevel {
    mid: MidLevel;
    anotherMid: MidLevel;
}

contract DeepHierarchical {
    top: TopLevel;

    init() {
        self.top = TopLevel{
            mid: MidLevel{inner: InnerMost{i:1,s:"x"},flag:true},
            anotherMid: MidLevel{inner: InnerMost{i:2,s:"y"},flag:false},
        };
    }
}

struct MidNested {
    flag: Bool;
    txt: String?;
}

struct TopNested {
    nestedA: MidNested;
    nestedB: MidNested;
    count: Int;
}

contract TestContract {
    val: TopNested;

    init() {
        self.val = TopNested{
            nestedA: MidNested{ flag:true, txt:"abc" },
            nestedB: MidNested{ flag:false, txt:null },
            count: 77,
        };
    }
}
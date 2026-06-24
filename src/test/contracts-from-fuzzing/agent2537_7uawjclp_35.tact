struct InnerS {
    val: Int;
}

struct OuterS {
    first: InnerS;
    second: InnerS;
    third: InnerS;
}

contract MultiStructStore {
    data: OuterS;
    init() {
        self.data = OuterS{
            first: InnerS{ val: 1 },
            second: InnerS{ val: 2 },
            third: InnerS{ val: 3 }
        };
    }
}
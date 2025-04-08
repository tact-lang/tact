struct MixedOptionalNested {
    id: Int = 1;
    details: Details?;
}

struct Details {
    flag: Bool;
    comment: String?;
}

contract TestContract {
    var: MixedOptionalNested;

    init() {
        self.var = MixedOptionalNested{
            details: Details{ flag:true, comment:null }
        };
    }
}
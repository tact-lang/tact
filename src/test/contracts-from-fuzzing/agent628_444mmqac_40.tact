struct InnerOptBool {
    b: Bool?;
}

struct OuterTwoOpt {
    inn: InnerOptBool?;
    flag: Bool?;
}

contract TwoLevelOptional {
    nested: OuterTwoOpt;

    init() {
        self.nested = OuterTwoOpt{ inn: null, flag: null };
    }
}
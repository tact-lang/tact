struct NestedOptional {
    i: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: NestedOptional?;
}

contract ContractOptInOpt {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ inner: null };
    }
}
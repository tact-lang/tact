struct NestedManyOptions {
    flag: Bool?;
    sub1: InnerOpt1?;
    sub2: InnerOpt2?;
}

struct InnerOpt1 {
    s: String?;
    num: Int?;
}

struct InnerOpt2 {
    addr: Address?;
    cell: Cell?;
}

contract DeepOptVariant {
    val: NestedManyOptions;

    init() {
        self.val = NestedManyOptions{ flag: null, sub1: null, sub2: null };
    }
}
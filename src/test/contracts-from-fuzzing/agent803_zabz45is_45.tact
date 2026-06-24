struct NestedOptional2 {
    val: Int?;
}

struct HolderNestedOpt {
    nested: NestedOptional2?;
    flag: Bool;
}

contract NestedOptionalContract {
    h: HolderNestedOpt;
    init() {
        self.h = HolderNestedOpt{
            nested: null,
            flag: false
        };
    }
}
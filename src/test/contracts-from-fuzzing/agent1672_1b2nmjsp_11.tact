struct OptionalNested {
    i: Int?;
    b: Bool?;
}

struct MoreOptionalNested {
    val: OptionalNested?;
}

contract TestContract {
    opt: MoreOptionalNested;
    init() {
        self.opt = MoreOptionalNested{
            val: null
        };
    }
}
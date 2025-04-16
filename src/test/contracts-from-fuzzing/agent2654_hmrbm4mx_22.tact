struct InnerOpt {
    x: Int?;
    s: String?;
}
struct OuterOpt {
    inn: InnerOpt?;
}

contract WrappedNestedOptional {
    outer: OuterOpt;

    init() {
        self.outer = OuterOpt{ inn: null };
    }
}
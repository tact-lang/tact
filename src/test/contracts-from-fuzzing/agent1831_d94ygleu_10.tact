struct NestedOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct OuterWrap {
    inner: NestedOptional?;
}

contract TestContract {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{ inner: null };
    }
}
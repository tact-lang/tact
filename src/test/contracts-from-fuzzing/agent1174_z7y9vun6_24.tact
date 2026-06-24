struct NestedOptional {
    a: Int?;
    b: String?;
    c: Cell?;
}

struct WrapOptional {
    inner: NestedOptional?;
}

contract NestedOptionalsTest {
    data: WrapOptional = WrapOptional{ inner: null };
}
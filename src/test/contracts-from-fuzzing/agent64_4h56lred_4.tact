struct NestedOptional {
    inner: InnerOpt;
}

struct InnerOpt {
    val: Int?;
}

contract NestedOptionalTest {
    persistent: NestedOptional = NestedOptional{
        inner: InnerOpt{ val: null }
    };
}
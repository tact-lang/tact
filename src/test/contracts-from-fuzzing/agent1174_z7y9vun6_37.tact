struct NestedOptionalDefaults {
    x: Int?;
}

struct OuterWithEmbeddedOpt {
    inner: NestedOptionalDefaults?;
}

contract NestedOptDefTest {
    val: OuterWithEmbeddedOpt = OuterWithEmbeddedOpt{ inner: null };
}
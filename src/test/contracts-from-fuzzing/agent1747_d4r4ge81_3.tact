struct S {
    f1: Int?;
    f2: Bool?;
}

contract OptionalNullsTest {
    val: S = S{ f1: null, f2: null };
    init() {}
}
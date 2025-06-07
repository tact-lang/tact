struct StrsWithDefaults {
    s1: String = "foo";
    s2: String = "bar";
}

contract StrDefaultTest {
    s: StrsWithDefaults = StrsWithDefaults{};
}
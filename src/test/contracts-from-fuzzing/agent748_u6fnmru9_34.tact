// Test of empty optional struct default
struct Mid {
    a: Int;
}
struct Wrap {
    m: Mid?;
}
contract NullNestedInit {
    p: Wrap = Wrap { m: null };
}
struct HasDef { a: Int=1; b: Int=2; }

contract OverrideTest {
    s: HasDef = HasDef{ a: 10, b: 20 };
}
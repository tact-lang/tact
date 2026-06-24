// Test E: Getter with nested block return (expected to compile successfully)

contract GetterNested {
    get fun test(): Int {
        { { return 6; } }
    }
}

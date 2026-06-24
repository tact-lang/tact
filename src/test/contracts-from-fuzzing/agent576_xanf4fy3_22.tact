struct HasDef { val: Int = 9; }

contract StructDefault {
    foo: HasDef = HasDef{};
}

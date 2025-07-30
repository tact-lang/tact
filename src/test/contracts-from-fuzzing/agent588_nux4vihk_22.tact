trait TraitOne {
    foo: Int;
}

contract WithTraitParam(
    foo: Int,
) with TraitOne {
    receive() {
        let _ = self.foo;
    }
}
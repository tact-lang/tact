trait TraitNested {
    foo: Int;
}

contract InheritNested with TraitNested {
    foo: Int;
    init(){ self.foo=42; }
}
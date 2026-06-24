trait NestedTrait { owner: Address }

contract TraitInheritance with NestedTrait {
    owner: Address;
    foo: Int;
    
    init() {
        self.owner = myAddress();
        self.foo = 42;
    }
}
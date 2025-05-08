trait TraitA {
    a: Int;  // no initializer allowed in trait
}

trait TraitB {
    a: Int;  // no initializer allowed in trait
}

// Using contract parameters to initialize trait fields.
contract TestConflict(a: Int) with TraitA, TraitB {
    // If trait fields are specified as contract parameters, no init function is allowed
    // and self.a is available as provided at deployment.
    receive() {
        dump(self.a);
        cashback(sender());
    }
}

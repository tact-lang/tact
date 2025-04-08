trait TraitA { foo: Int; }
trait TraitB { bar: Bool; }

contract MultiParam(
    foo: Int,
    bar: Bool,
) with TraitA, TraitB {
    receive() {
        if (self.bar) { let _ = self.foo; }
    }
}
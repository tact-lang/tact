trait TraitA { a: Int }
trait TraitB { b: Bool }

contract MultiTrait with TraitA, TraitB {
    a: Int;
    b: Bool;

    init() {
        self.a = 42;
        self.b = true;
    }
}
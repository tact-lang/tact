trait TraitA { valA: Int; }
trait TraitB { valB: Bool; }

contract MultiTrait with TraitA, TraitB {
    valA: Int;
    valB: Bool;

    init() {
        self.valA = 1;
        self.valB = true;
    }
}
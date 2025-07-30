trait TraitA {
    a: Int;
}

trait TraitB {
    a: Int;
}

contract ConflictContract(a: Int) with TraitA, TraitB {}

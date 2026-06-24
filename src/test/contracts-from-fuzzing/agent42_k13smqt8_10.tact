trait TraitA {
    a: Int;
}

trait TraitB {
    a: Int;
}

contract Test(a: Int) with TraitA, TraitB {
    receive() {
        dump(self.a);
    }
}

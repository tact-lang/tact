trait WithConstant {
    const TraitA: Int = 41;
    const TraitB: Int = self.TraitA + 1;

    const TraitA2: Int = 41;
    const TraitC2: Int = self.TraitA2 + 1 + self.TraitB2;
    const TraitB2: Int = 9;
}

contract ConstantTester with WithConstant {
    const A: Int = 41;
    const B: Int = self.A + 1;

    const A2: Int = 41;
    const C2: Int = self.A2 + 1 + self.B2;
    const B2: Int = 9;

    value: Int = self.B2 + self.C2;

    receive() {}

    get fun b(): Int {
        return self.B;
    }

    get fun c2(): Int {
        return self.C2;
    }

    get fun value(): Int {
        return self.value;
    }

    get fun traitB(): Int {
        return self.TraitB;
    }

    get fun traitC2(): Int {
        return self.TraitC2;
    }
}

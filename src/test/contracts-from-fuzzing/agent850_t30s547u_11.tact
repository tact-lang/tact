struct Kid {
    data: Int;
}

struct Dad {
    kid1: Kid;
    kid2: Kid;
}

struct Grandpa {
    dad: Dad;
}

contract FamilyTree {
    lineage: Grandpa;

    init() {
        self.lineage = Grandpa{
            dad: Dad{
                kid1: Kid{ data: 1 },
                kid2: Kid{ data: 2 },
            }
        };
    }
}
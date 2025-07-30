struct Level3 { v3: Int }

struct Level2 { v2: Int; next: Level3 }

struct Level1 { v1: Int; next: Level2 }

contract NestedChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            v1: 1,
            next: Level2{
                v2: 2,
                next: Level3{ v3: 3 }
            }
        };
    }
}

struct ChainLevel3 { k: Int; }

struct ChainLevel2 { c: ChainLevel3; }

struct ChainLevel1 { b: ChainLevel2; }

contract ChainFields {
    root: ChainLevel1;
    init() {
        self.root = ChainLevel1{ b: ChainLevel2{ c: ChainLevel3{ k: 99 } } };
    }
}
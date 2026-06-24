struct SeqA { a: Int; }
struct SeqB { b: SeqA; }
struct SeqC { c: SeqB; }
struct SeqD { d: SeqC; }
struct SeqE { e: SeqD; }

contract ChainStore {
    x: SeqE;
    init() {
        self.x = SeqE{ e: SeqD{ d: SeqC{ c: SeqB{ b: SeqA{ a: 123 } } } } };
    }
}
struct SeqA { x: Int }
struct SeqB { a: SeqA }
struct SeqC { b: SeqB }

contract SequenceTest {
    s: SeqC;

    init() {
        self.s = SeqC{ b: SeqB{ a: SeqA{ x: 5 } } };
    }
}

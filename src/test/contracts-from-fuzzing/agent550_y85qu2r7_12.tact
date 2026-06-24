struct SeqA { x: Int; y: Int; }
struct SeqB { a: SeqA; b: Int; }
struct SeqC { c: SeqB; z: Int; }

contract DeepSeq {
    val: SeqC;

    init() {
        self.val = SeqC{
            c: SeqB{ a: SeqA{x:1, y:2}, b:3 },
            z:4
        };
    }
}
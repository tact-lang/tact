struct ChainA { a: Int }
struct ChainB { b: ChainA }
struct ChainC { c: ChainB }

contract ReplaceTest {
    val: ChainC;

    init() {
        self.val = ChainC{
            c: ChainB{
                b: ChainA{ a: 7 }
            }
        };
    }
}
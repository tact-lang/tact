struct Deep1 { val: Int; next: Deep2; }
struct Deep2 { val: Bool; next: Deep3; }
struct Deep3 { val: String; next: Deep4; }
struct Deep4 { val: Slice; }

contract DeepChain {
    chain: Deep1;

    init() {
        self.chain = Deep1{
            val: 1,
            next: Deep2{
                val: true,
                next: Deep3{
                    val: "deep",
                    next: Deep4{ val: emptyCell().asSlice() }
                }
            }
        };
    }
}
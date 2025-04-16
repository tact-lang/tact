struct ChainLevel1 {
    val: Int;
    next: ChainLevel2;
}
struct ChainLevel2 {
    val: Bool;
    next: ChainLevel3;
}
struct ChainLevel3 {
    val: String;
}

contract ChainContract {
    chain: ChainLevel1;

    init() {
        self.chain = ChainLevel1{
            val: 1,
            next: ChainLevel2{
                val: true,
                next: ChainLevel3{ val: "end" }
            }
        };
    }
}
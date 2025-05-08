struct ChainA { 
    val: Int; 
    next: ChainB; 
}
struct ChainB {
    val: Int?; 
    next: ChainC;
}
struct ChainC {
    val: String; 
    opt: Bool?;
}

contract Test {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            val:1,
            next: ChainB{
                val:null,
                next: ChainC{
                    val:"str",
                    opt: null
                }
            }
        };
    }
}

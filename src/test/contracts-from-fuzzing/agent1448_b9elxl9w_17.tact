struct Level3 {
    val: Int;
}
struct Level2 {
    inner: Level3;
}
struct Level1 {
    layer: Level2;
}

contract DeepChain {
    chain: Level1;

    init() {
        self.chain = Level1{
            layer: Level2{
                inner: Level3{ val: 123 }
            }
        };
    }
}
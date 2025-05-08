struct ChainLayer1 { val: Int; }
struct ChainLayer2 { next: ChainLayer1; }
struct ChainLayer3 { next: ChainLayer2; }

contract ChainStorageContract {
    data: ChainLayer3;

    init() {
        self.data = ChainLayer3{
            next: ChainLayer2{
                next: ChainLayer1{val:53}
            }
        };
    }
}
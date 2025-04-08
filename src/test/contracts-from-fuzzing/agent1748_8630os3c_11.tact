struct ChainA { x: Int; } 
struct ChainB { inner: ChainA; }
struct ChainC { inner: ChainB; }

contract ChainPersist {
    val: ChainC;

    init() {
        self.val = ChainC{
            inner: ChainB{
                inner: ChainA{ x: 99 }
            }
        };
    }
}
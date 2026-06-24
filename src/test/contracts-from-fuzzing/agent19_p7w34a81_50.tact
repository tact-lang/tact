struct ChainInf1 { x: Int; }
struct ChainInf2 { y: ChainInf1; }
struct ChainInf3 { z: ChainInf2; }

contract Layers3 {
    data: ChainInf3;

    init() {
        self.data = ChainInf3{
            z: ChainInf2{
                y: ChainInf1{ x: 999 },
            },
        };
    }
}
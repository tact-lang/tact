struct ChainX1 {
    z: ChainX2;
}

struct ChainX2 {
    z: ChainX3;
}

struct ChainX3 {
    z: ChainX4;
}

struct ChainX4 {
    z: ChainX5;
}

struct ChainX5 {
    q: Int;
}

contract ChainTest {
    data: ChainX1;

    init() {
        self.data = ChainX1{
            z: ChainX2{
                z: ChainX3{
                    z: ChainX4{
                        z: ChainX5{
                            q: 7
                        }
                    }
                }
            }
        };
    }
}
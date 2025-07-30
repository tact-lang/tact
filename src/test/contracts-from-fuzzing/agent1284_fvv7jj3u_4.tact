struct Deep1 { x: Int; next: Deep2; }
struct Deep2 { y: Int; next: Deep3; }
struct Deep3 { z: Int; }

contract ChainDeep {
    chain: Deep1;

    init() {
        self.chain = Deep1{
            x:1,
            next: Deep2{
                y:2,
                next: Deep3{
                    z:3,
                },
            },
        };
    }
}
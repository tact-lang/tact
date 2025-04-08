struct ChainA { a:Int; chainB:ChainB; }
struct ChainB { b:Int; chainC:ChainC; }
struct ChainC { c:Int; }

contract TestContract {
    thing: ChainA;
    init() {
        self.thing = ChainA{
            a: 10,
            chainB: ChainB{b:20, chainC:ChainC{c:30}}
        };
    }
}
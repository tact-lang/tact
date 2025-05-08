struct IntPair { x:Int; y:Int; }

contract DeserializeTest {
    p: IntPair;
    init() {
        self.p = IntPair{ x:1, y:2 };
    }
    
    receive() {
        let c = self.p.toCell();
        let parsed = IntPair.fromCell(c);
        self.p = parsed;
    }
}
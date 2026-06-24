struct OptSer {
    x: Int? as uint4;
    y: Int? as uint8;
}

contract OptSerTest {
    s: OptSer;
    init() {
        self.s = OptSer{ x:null, y:null };
    }
}
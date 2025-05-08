struct WithOptStruct {
    nested: Int?;
}

contract Test {
    w: WithOptStruct?;
    init() {
        self.w = null;
    }
    receive() { let _ = self.w; }
}
contract SerializeEdge {
    tiny: Int as uint1;
    huge: Int as int257;
    
    init() {
        self.tiny = 1;
        self.huge = 123456789;
    }
}
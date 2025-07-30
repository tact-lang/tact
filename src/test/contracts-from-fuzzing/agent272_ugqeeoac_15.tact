struct OptStringBool {
    s: String?;
    b: Bool?;
}

contract OptSBPersist {
    osb: OptStringBool;
    init() {
        self.osb = OptStringBool{
            s:null,
            b:true
        };
    }
}
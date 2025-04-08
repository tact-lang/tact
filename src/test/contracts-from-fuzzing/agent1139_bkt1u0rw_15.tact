struct OptInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract PersistOptInStruct {
    s: OptInStruct?;
    
    init() {
        self.s = null;
    }
}
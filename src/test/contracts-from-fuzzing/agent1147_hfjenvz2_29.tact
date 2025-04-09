// optional String with default explicitly set
contract OptStringDefault {
    s: String? = null;
    
    init() {
        self.s = "abc";
    }
}
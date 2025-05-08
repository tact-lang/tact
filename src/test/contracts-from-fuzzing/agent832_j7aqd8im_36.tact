trait TOpt {
    x: Int?;
}

contract TraitOptional with TOpt {
    x: Int?;
    init() {
        self.x = null;
    }
    receive() {
        if(self.x != null) { let _ = self.x!!; }
    }
}
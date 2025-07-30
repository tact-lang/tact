// Test default-initialized optional persistent field with no explicit assignment in init()
contract TestContract {
    opt1: Int?;
    opt2: Bool?;
    opt3: Cell?;
    opt4: Address?;
    
    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
    }
}
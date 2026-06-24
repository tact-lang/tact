contract TestContract {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool?;
    b6: Bool?;
    b7: Bool?;
    b8: Bool?;
    
    init() {
        self.b5 = null;
        self.b6 = true;
        self.b7 = false;
        self.b8 = null;
    }

    receive() {
        self.b5 = true;
    }
}
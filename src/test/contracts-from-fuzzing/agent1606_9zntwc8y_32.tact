contract BigOptionChain {
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
    x5: Int?;
    x6: Int?;
    x7: Int?;
    x8: Int?;
    x9: Int?;

    init() {
        self.x1=null; self.x2=null; self.x3=null; self.x4=null; self.x5=null;
        self.x6=null; self.x7=null; self.x8=null; self.x9=null;
    }

    receive() {
        let _ = self.x1; let _ = self.x2; let _ = self.x3; let _ = self.x4; let _ = self.x5;
        let _ = self.x6; let _ = self.x7; let _ = self.x8; let _ = self.x9;
    }
}
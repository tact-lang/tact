contract TestContract {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;
    b6: Bool = false;

    init() {
        self.b1=true; self.b2=false; self.b3=true;
        self.b4=false; self.b5=true; self.b6=false;
    }

    receive() { let zz = self.b5; }
}
contract MultiBool {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;
    b6: Bool = false;

    receive(){
        self.b1 = !self.b1;
    }
}
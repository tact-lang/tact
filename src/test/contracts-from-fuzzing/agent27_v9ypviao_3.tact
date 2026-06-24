contract TestBoolLiterals {
    receive() {
         let b1: Bool = true;
         let b2: Bool = false;
         let b3: Bool = b1 && b2;
         let b4: Bool = b1 || b2;
    }
}

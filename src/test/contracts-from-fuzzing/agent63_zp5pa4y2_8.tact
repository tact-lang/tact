contract TestBoolConstant {
    // Testing a constant of type Bool
    const FLAG: Bool = true;

    receive() {
         let flag: Bool = self.FLAG;
         if (flag) { } else { }
    }
}

contract TestMuldivc {
    // Testing muldivc: computes (x * y) / z, rounding up
    receive() {
        let r1: Int = muldivc(3, 4, 5);  // (3*4)=12, 12/5=2.4 round up => 3
        let r2: Int = muldivc(-3, 4, 5); // (-3*4)=-12, -12/5=-2.4 round up => -2
        dump(r1 + r2); // expect 3 + (-2) = 1
        return;
    }
}

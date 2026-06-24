contract TestModulo {
    receive() {
        let five = 5;
        let negFive = -five;
        let a = 1 % five;   // expected 1
        let b = 1 % negFive; // expected -4, as per documentation (because modulo instead of remainder)
        if (a != 1 || b != -4) { throw(1); }
        cashback(sender());
    }
}

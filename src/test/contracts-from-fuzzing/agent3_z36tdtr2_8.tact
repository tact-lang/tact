contract TestModulo {
    fun test() {
        let five = 5;
        let mod1 = 1 % five;  // expected 1, as 1 modulo 5 is 1
        let mod2 = 1 % (-five); // expected -4 according to documentation
        dump(mod1);
        dump(mod2);
    }

    receive() {
        self.test();
    }
}

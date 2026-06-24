contract TestUnaryOperators {
    fun test() {
        let a = 5;
        let b = -a;       // expected -5
        let c = ~a;       // expected: ~5; documentation says ~5 equals -6
        let d = -(~a);    // expected 6, as -(~5) = 6
        let e = ~(-a);    // expected 4, as ~( -5 ) = 4

        dump(b);
        dump(c);
        dump(d);
        dump(e);
    }

    receive() {
        self.test();
    }
}

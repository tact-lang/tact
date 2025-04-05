contract TestBitwiseOperators {
    fun showcase() {
        let five = 5;
        // Negation: expected -5
        dump(-five);
        // Bitwise NOT on 5: expected -6
        dump(~five);
        // Negation after bitwise NOT: expected 6
        dump(-( ~five));
        // Bitwise NOT after negation: expected 4
        dump(~(-five));

        let four = 4;
        // Bitwise left shift: 5 << 2 = 20
        dump(five << 2);
        // Bitwise right shift: 4 >> 2 = 1
        dump(four >> 2);
        // Right shift on -four: expected -1 because arithmetic shift maintains sign
        dump(-four >> 2);
    }

    receive() {
        self.showcase();
    }
}

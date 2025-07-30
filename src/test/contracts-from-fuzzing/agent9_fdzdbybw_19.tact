struct Pair { first: Int; second: Int; }

contract TestDestructuring {
    fun test() {
        // Testing destructuring assignment with a struct
        let p: Pair = Pair{ first: 10, second: 20 };
        let Pair { first: a, second: b } = p;
        dump(a); // Expected output: 10
        dump(b); // Expected output: 20
    }

    receive() {
        self.test();
    }
}

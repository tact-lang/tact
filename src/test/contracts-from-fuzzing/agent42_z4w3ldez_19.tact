trait RecTrait {
    // A recursive function that counts down from n to 0
    fun rec(n: Int): Int {
        if (n <= 0) {
            return 0;
        } else {
            return self.rec(n - 1) + 1;
        }
    }
}

contract RecContract() with RecTrait {
    receive() {
        // Expect rec(5) to return 5
        dump(self.rec(5));
        cashback(sender());
    }
}

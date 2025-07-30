fun add(a: Int, b: Int): Int {
    return a + b;
}

trait AddTrait {
    // This adds an extra 1, so it should override the global add
    fun add(a: Int, b: Int): Int {
        return a + b + 1;
    }
}

contract Overloaded() with AddTrait {
    fun test(): Int {
        // Should invoke the trait's add function: (2+3)+1 = 6
        return self.add(2, 3);
    }

    receive() {
        dump(self.test());
        cashback(sender());
    }
}

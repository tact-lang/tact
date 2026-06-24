trait T1 {
    fun myVal(): Int {
        return 10;
    }
}

trait T2 {
    fun myVal(): Int {
        return 20;
    }
}

contract Merge with T1, T2 {
    // We must override myVal() to resolve the conflict between T1 and T2
    override fun myVal(): Int {
        // Let's choose to return 30
        return 30;
    }

    receive() {
        let v = self.myVal();
        require(v == 30, "Conflict resolution failed");
        cashback(sender());
    }
}

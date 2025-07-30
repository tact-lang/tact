trait A {
    fun getA(): Int { 
        return 10; 
    }
}

trait B with A {
    override fun getA(): Int {
        return 20;
    }
}

contract Test2() with A, B {
    receive() {
       let x = self.getA();
       require(x == 20, "getA did not resolve to 20");
       cashback(sender());
    }
}

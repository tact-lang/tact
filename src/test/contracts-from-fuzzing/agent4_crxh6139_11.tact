/*
   This test verifies that when a contract inherits multiple traits that define the same virtual constant,
   the contract override takes precedence over all trait defaults regardless of the inheritance order.
   
   Trait T1 defines a virtual constant VALUE with default 100.
   Trait T2 defines a virtual constant VALUE with default 200.
   The contract TestValue inherits both traits and overrides the constant VALUE to 300.
   In the receive function, it requires that self.VALUE equals 300.
*/

trait T1 {
    virtual const VALUE: Int = 100;
}

trait T2 {
    virtual const VALUE: Int = 200;
}

contract TestValue() with T1, T2 {
    override const VALUE: Int = 300;

    receive() {
        let v = self.VALUE; // expected to be 300
        require(v == 300, "fail");
        cashback(sender());
    }
}

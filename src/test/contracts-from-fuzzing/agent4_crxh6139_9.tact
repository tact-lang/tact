/*
   This test verifies that a trait can define a function that uses an abstract constant,
   and that the contract overriding the abstract constant will have the correct behavior.

   Trait AbstractConstTrait declares an abstract constant C and provides a default function getC()
   that returns self.C. Contract Concrete overrides C to be 42.

   Expected behavior: Calling self.getC() should return 42.
*/

trait AbstractConstTrait {
    abstract const C: Int;

    virtual fun getC(): Int {
        return self.C;
    }
}

contract Concrete() with AbstractConstTrait {
    override const C: Int = 42;

    receive() {
        let a = self.getC(); // expected: 42
        require(a == 42, "Incorrect value of abstract constant C");
        cashback(sender());
    }
}

/*
  This test focuses on advanced trait composition and inheritance in Tact.
  It defines two traits:
    - MyBase: introduces a virtual function 'f' with default implementation
    - MyDerived: inherits MyBase and overrides 'f'
  Then, a contract LayeredContract inherits MyDerived, and calls f() in its receive function.

  Expected behavior: self.f() should return 2.
*/

trait MyBase {
    virtual fun f(): Int {
        return 1;
    }
}

trait MyDerived with MyBase {
    override fun f(): Int {
        return 2;
    }
}

contract LayeredContract() with MyDerived {
    receive() {
        let result = self.f(); // expected to be 2
        // For testing, we forward control
        cashback(sender());
    }
}

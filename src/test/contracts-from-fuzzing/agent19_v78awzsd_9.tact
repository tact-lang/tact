/// Test Case 11: Traits, Assembly, and Try-Catch

// Assembly function as defined in the documentation
asm fun rawReserveExtra(amount: Int, extraAmount: Cell, mode: Int) { RAWRESERVEX }

// Define a trait with abstract and virtual constants and an abstract function
trait MyTraitTest {
    abstract const abstractConst: Int;
    virtual const virtualConst: Int = 100;
    abstract fun traitFun(x: Int): Int;
}

// Contract that implements the trait, overriding constants and abstract function
contract TestTraitConst(x: Int) with MyTraitTest {
    override const abstractConst: Int = 200;
    override const virtualConst: Int = 300;
    override fun traitFun(x: Int): Int {
        return x * 2;
    }
    receive() {
        let a: Int = self.abstractConst;    // expected 200
        let b: Int = self.virtualConst;       // expected 300
        let c: Int = self.traitFun(10);         // expected 20
        cashback(sender());
    }
}

// Contract that tests calling an assembly function
contract TestAssembly() {
    fun run() {
        // Call rawReserveExtra; if not enough funds it may fail at runtime, but here we just test compile-time type checking
        rawReserveExtra(ton("0.1"), emptyCell(), 0);
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

// Contract that tests try-catch functionality
contract TestTryCatch() {
    fun run() {
        try {
            throw(777);
        } catch (exitCode) {
            // exitCode should capture the thrown value; no further action
        }
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

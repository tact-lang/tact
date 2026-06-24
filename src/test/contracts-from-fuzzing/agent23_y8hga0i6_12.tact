// Test 1: Top-level constant declaration and usage in a contract
const MY_CONSTANT: Int = 42;

contract Test1 {
    receive() {
        // Directly using a top-level constant
        let a: Int = MY_CONSTANT;
    }
}


// Test 2: Contract constant declaration accessed with self.
contract Test2 {
    const X: Int = 10;
    
    receive() {
        // Must access contract constants via self.X
        let b: Int = self.X;
    }
}


// Test 3: Boolean constant used for compile-time branch elimination.
contract BranchTest {
    const ENABLE_FEATURE: Bool = true;

    receive() {
        if (self.ENABLE_FEATURE) {
            let val: Int = 100;
        } else {
            let val: Int = 0;
        }
    }
}


// Test 4: Virtual constant in a trait that is overridden in a contract
trait FeatureTrait {
    virtual const FEATURE: Bool = false;
}

contract TestVirtual with FeatureTrait {
    override const FEATURE: Bool = true;

    receive() {
        if (self.FEATURE) {
            let v: Int = 1;
        } else {
            let v: Int = 0;
        }
    }
}


// Test 5: Constant arithmetic expression at compile time
const SUM: Int = 20 + 22;

contract TestArith {
    receive() {
        let result: Int = SUM;
    }
}


// Test 6: Abstract constant in a trait and its proper override
trait AbstractTrait {
    abstract const A: Int;
}

contract TestAbstract with AbstractTrait {
    override const A: Int = 123;

    receive() {
        let y: Int = self.A;
    }
}

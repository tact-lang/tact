// Test 1: Simple top-level constant
const MY_CONSTANT: Int = 42;

fun getConstant(): Int {
    return MY_CONSTANT;
}

contract TestContract1 {
    receive() {
        getConstant();
    }
}

// Test 2: Constant arithmetic expression
const ADD: Int = 1 + 2;

fun testAdd(): Int {
    return ADD;
}

contract TestContract2 {
    receive() {
        testAdd();
    }
}

// Test 3: Constant of Bool type
const FLAG: Bool = true;

fun testBool(): Bool {
    return FLAG;
}

contract TestContract3 {
    receive() {
        testBool();
    }
}

// Test 4: Constant using compile-time function ton()
const ONE: Int = ton("1");

fun getOne(): Int {
    return ONE;
}

contract TestContract4 {
    receive() {
        getOne();
    }
}

// Test 5: Constants inside traits (virtual and abstract) and overriding in contract
trait FeeTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

trait DevFeeTrait {
    abstract const MY_DEV_FEE: Int;
}

contract TestContract5 with FeeTrait, DevFeeTrait {
    override const MY_FEE: Int = ton("0.5");
    override const MY_DEV_FEE: Int = ton("1000");
    
    receive() {
        // Use overridden constants
        let total: Int = self.MY_FEE + self.MY_DEV_FEE;
    }
}

// Test 6: Constant declared within contract body
contract TestContract6 {
    const INNER_CONST: Int = 10;
    
    receive() {
        let sum: Int = self.INNER_CONST + 2;
    }
}

// Uncommenting the following test should trigger a type error
// const BAD: Int = true;

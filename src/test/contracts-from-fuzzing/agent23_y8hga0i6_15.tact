// Test 7: Top-level constants referencing each other
const X: Int = 10;
const Y: Int = X + 5;

contract TestRef {
    receive() {
        let z: Int = Y;
    }
}


// Test 8: Top-level constant using a compile-time function (ton conversion)
const FEE: Int = ton("1.0");

contract TestTon {
    receive() {
        let f: Int = FEE;
    }
}

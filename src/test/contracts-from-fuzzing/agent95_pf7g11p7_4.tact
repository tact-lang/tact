// Test 1: Optional Type
// According to documentation in [Optionals](/book/optionals), an optional value can be null and later assigned a non-null value. The non-null assertion operator (!!) should yield the underlying value if it isn't null.

contract OptionalTest {
    fun test() {
        let opt: Int? = null;
        // Later assign a non-null value
        opt = 255;
        // Using non-null assertion should produce 255
        dump(opt!!);
    }
    
    receive() {
        self.test();
    }
}

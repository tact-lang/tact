struct A { x: Int; }

contract StructExprTest {
    fun test() {
        // Instantiating a struct and accessing its field
        let a: A = A{ x: 100 };
        dump(a.x); // Expected output: 100
    }

    receive() {
        self.test();
    }
}
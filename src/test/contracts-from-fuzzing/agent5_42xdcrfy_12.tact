struct Point { x: Int; y: Int; }

contract DestructTest {
    fun test(): Int {
        let p: Point = Point { x: 42, y: 17 };
        // Destructure p into x and y
        let Point { x, y } = p;
        // Also test renaming: extract x as newX
        let Point { x: newX, .. } = p;
        // Return sum of fields; newX is same as x, i.e. 42
        return x + y + newX; // expected 42+17+42 = 101
    }

    receive() {
        self.test();
    }
}

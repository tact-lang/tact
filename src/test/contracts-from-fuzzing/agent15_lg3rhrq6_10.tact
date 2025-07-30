struct Point { x: Int; y: Int }

contract Test {
    // Helper function to return a Point
    fun getPoint(): Point {
        return Point { x: 10, y: 32 };
    }
    
    // Testing destructuring assignment statement
    receive() {
        let Point { x, y } = self.getPoint();
        dump(x + y);

        // Testing block statements with nested if-else
        if (x > 5) {
            dump(1);
        } else if (y > 30) {
            dump(2);
        } else {
            dump(3);
        }

        // Testing return statement within a function and using it in a receiver
        dump(self.getNum());
    }

    fun getNum(): Int {
        // Using a simple if statement and a return statement
        if (true) {
            return 99;
        }
        return 0; // unreachable
    }
}

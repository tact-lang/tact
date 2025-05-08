// Test 1. Destructuring assignment in a function and contract

struct Point { x: Int; y: Int }

fun getPoint(): Point { 
    return Point { x: 1, y: 2 };
}

contract Test {
    receive() {
        let Point { x, y } = getPoint();
        dump(x);
        dump(y);
    }
}

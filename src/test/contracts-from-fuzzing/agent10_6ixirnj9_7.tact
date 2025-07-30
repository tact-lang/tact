// Test: Valid usage in destructuring assignment (match pattern with discard)
struct Pair { first: Int; second: Int }

contract Test {
    receive() {
        let p = Pair { first: 100, second: 200 };
        // Discard the second field using wildcard
        let Pair { first, second: _ } = p;
        dump(first); // should dump 100
    }
}

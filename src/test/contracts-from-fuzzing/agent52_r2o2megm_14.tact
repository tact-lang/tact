// Scenario I (revised): Destructuring assignment with wildcard discard in struct destructuring

struct Pair { first: Int; second: Int }

contract Test {
    receive() {
        // Correct syntax for discarding a field: specify the field name, then colon, then underscore
        let Pair { first, second: _ } = Pair { first: 5, second: 10 };
        dump(first); // Expected to dump 5
    }
}

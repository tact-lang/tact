/* Test: Destructuring assignment discarding a field using '_' */

struct Pair { first: Int; second: Int }

fun getFirst(p: Pair): Int {
    // Discard the 'second' field
    let Pair { first, second: _ } = p;
    return first;
}

contract Test {
    receive() {
        let x = getFirst(Pair { first: 10, second: 20 });
    }
}

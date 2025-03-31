// Test 9: Destructuring assignment with renaming to wildcard

struct Pair { a: Int; b: Int }

fun test() {
    let Pair { a: _, b } = Pair { a: 5, b: 10 };
    dump(b);
}

contract Test {
    receive() {
        test();
    }
}

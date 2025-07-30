/* Test H: Using wildcard in destructuring assignment (should be allowed as discard) */

struct Two {
    first: Int;
    second: String;
}

fun test(): Int {
    // Destructure struct Two while discarding 'second'
    let Two { first, second: _ } = Two { first: 10, second: "hello" };
    return first;
}

contract TestH {
    receive() {
        test();
    }
}

// Snippet 8: Using _ in a match pattern (destructuring) - valid usage

struct Two { first: Int; second: Int }

fun discardTwo(s: Two) {
    // Discard the 'second' field and capture 'first'
    let Two { second: _, first } = s;
    dump(first);
}

contract TestDestruct {
    receive() {
        discardTwo(Two { first: 7, second: 9 });
    }
}

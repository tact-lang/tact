struct Example { num: Int }

fun test_destructuring(): Int {
    let Example { num } = Example { num: 42 };
    return num;
}

contract TestDestructuring {
    receive() {
        dump(test_destructuring());
    }
}

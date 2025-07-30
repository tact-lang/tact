struct Example { number: Int }

fun getExample(): Example {
    return Example { number: 42 };
}

contract TestDestructuring {
    receive() {
        let Example { number } = getExample();
        dump(number); // should dump 42
    }
}

struct Example { number: Int }

fun getExample(): Example { return Example { number: 42 } }

contract Test {
    receive() {
        let Example { number, } = getExample();
        dump(number);
    }
}

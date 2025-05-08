struct Pair { a: Int; b: Int }

contract DestructuringCommaTest {
    receive() {
        let Pair { a, b, } = Pair { a: 1, b: 2, };
        dump(a);
        dump(b);
    }
}

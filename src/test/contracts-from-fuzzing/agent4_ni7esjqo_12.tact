struct Pair { a: Int; b: Int }

contract TestDestructuring {
    receive() {
        let p: Pair = Pair { a: 10, b: 20 };
        let Pair { a, b } = p;
        dump(a);
        dump(b);
    }
}

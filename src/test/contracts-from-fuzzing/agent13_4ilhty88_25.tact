struct Pair { a: Int; b: Int }

contract TestDestructuringIgnore {
    receive() {
        let p: Pair = Pair { a: 10, b: 20 };
        let Pair { a, .. } = p;
        dump(a); // expecting 10
    }
}

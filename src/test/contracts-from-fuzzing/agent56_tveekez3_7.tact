struct Pair { x: Int; y: Int }

contract TestDestruct {
    receive() {
        let p: Pair = Pair { x: 10, y: 32 };
        let Pair { x: a, y: b } = p;
        dump(a + b);
    }
}

struct Two { a: Int; b: Int }

contract Test {
    receive() {
        let t: Two = Two { a: 10, b: 20 };
        let Two { a, b: _ } = t;
        dump(a);
    }
}

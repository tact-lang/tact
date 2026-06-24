struct Two { a: Int; b: Int }

contract TestDestructuringOK {
    receive() {
        let instance = Two { a: 1, b: 2 };
        let Two { a, b } = instance;
        dump(a + b); // expects 3
    }
}

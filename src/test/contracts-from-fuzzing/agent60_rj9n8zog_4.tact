struct Two { first: Int; second: String }

contract Test {
    receive() {
        let t = Two { first: 5, second: "Hello" };
        let Two { second: _, first } = t;
        dump(first);
    }
}

struct Two { first: Int; second: String }

contract TestDestruct {
    receive() {
        let two = Two { first: 1, second: "hello" };
        let Two { first, second: _ } = two;
    }
}

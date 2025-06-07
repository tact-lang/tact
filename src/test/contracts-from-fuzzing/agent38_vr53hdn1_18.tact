struct Foo { x: Int; y: Int; }

contract TestDestructuringAssignmentCorrect {
    receive() {
        // Correct struct instantiation using comma for instantiation
        let Foo { x, y } = Foo { x: 10, y: 20, };
        dump(x + y); // Expected to dump 30
    }
}

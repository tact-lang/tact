struct Example { a: Int }

contract TestDestructure {
    receive() {
        let ex: Example = Example { a: 42 };
        let Example { a } = ex;
        dump(a); // expecting 42
    }
}

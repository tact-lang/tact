struct Point { x: Int; y: Int }

contract Test {
    receive() {
        // Using '_' in match destructuring to discard a field is allowed
        let Point { x, y: _ } = Point { x: 42, y: 100 };
        dump(x);
    }
}

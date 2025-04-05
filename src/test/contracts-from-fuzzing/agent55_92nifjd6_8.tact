struct Example { field: Int }

contract TestDestructure {
    receive() {
        let Example { field } = Example { field: 42 };
        dump(field);
    }
}

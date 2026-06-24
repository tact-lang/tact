struct Example { field: Int }

fun naming() {
    let Example { field: renamed } = Example { field: 42 };
    dump(renamed);
}

contract Test {
    receive() {
        naming();
    }
}

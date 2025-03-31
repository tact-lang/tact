contract ExampleContract {
    receive() {}
}

contract Test {
    receive() {
        // Attempt to use initOf and codeOf without explicit type annotations
        let x = initOf ExampleContract();
        let y = codeOf ExampleContract;
        x;
        y;
    }
}

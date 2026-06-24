contract B {
    receive() {}
}

contract TestCodeOf {
    receive() {
        let c = codeOf B;
        c; // utilizing c to avoid unused variable warning
    }
}
contract B {
    receive() {}
}

contract Test {
    receive() {
        let st = initOf B();
        let cd = codeOf B;
    }
}
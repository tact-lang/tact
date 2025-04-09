contract B(param: Int) {
    // implicit init created because contract uses parameters
}

contract TestB {
    receive() {
        let st = initOf B(42);
        let cd = codeOf B;
    }
}

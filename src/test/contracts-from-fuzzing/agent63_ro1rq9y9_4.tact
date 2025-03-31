contract B(x: Int) {
    // Contract with contract parameter x
    receive() {}
}

contract Test1 {
    receive() {
        let s = initOf B(10);
        let c = codeOf B;
    }
}

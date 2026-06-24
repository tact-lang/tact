contract B(x: Int, y: Int) {
    // Contract with parameters
    receive() {}
}

contract TestValid2 {
    receive() {
        let initCell: StateInit = initOf B(10, 20,);
        let codeCell: Cell = codeOf B;
    }
}

contract TestInit {
    init() {}
    receive() {
        let initState = initOf TestInit();
        let codeCell = codeOf TestInit;
    }
}

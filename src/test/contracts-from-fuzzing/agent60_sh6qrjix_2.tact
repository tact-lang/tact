contract TestContract {
    init() {}

    receive() {
        let initPkg: StateInit = initOf TestContract();
        let codeCell: Cell = initPkg.code;
        let dataCell: Cell = initPkg.data;
    }
}

contract Valid {
    init() {}
    receive() {
         let s: StateInit = initOf Valid();
         let c: Cell = codeOf Valid;
    }
}

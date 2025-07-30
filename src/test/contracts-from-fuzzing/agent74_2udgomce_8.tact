contract TrailingInit {
    init(
        a: Int, // trailing comma allowed
    ) {
        let _ = a;
    }
    receive() {}
}

contract TestTrailing {
    receive() {
         let s: StateInit = initOf TrailingInit(5);
         let c: Cell = codeOf TrailingInit;
    }
}

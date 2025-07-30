/* Snippet 1: Simple cross-contract initialization */
contract SimpleChild {
    init() {}
    receive() {}
}

contract SimpleParent {
    receive() {
        let s: StateInit = initOf SimpleChild();
        self.reply("Simple OK".asComment());
    }
}

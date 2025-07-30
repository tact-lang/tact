contract D(x: Int, y: Int) {}

contract TestTrailing {
    receive() {
        let s: StateInit = initOf D(1, 2,);
        let c: Cell = codeOf D;
    }
}

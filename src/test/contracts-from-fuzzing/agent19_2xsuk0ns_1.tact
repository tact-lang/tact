contract B {
    init(x: Int) {}
}

contract A {
    get fun test(): Int {
        let s: StateInit = initOf B(42);
        return 1;
    }
}

contract TrailingInit {
    // Using trailing comma in parameter list
    init(a: Int, b: Int, ) {}
    receive() {}
}

contract TestTrailing {
    receive() {
         let state = initOf TrailingInit(5, 6);
         let code = codeOf TrailingInit;
    }
}

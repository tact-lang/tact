contract ExplicitInit {
    init(x: Int, y: Int) {}
    receive() {}
}

contract TestExplicit {
    receive() {
         let state = initOf ExplicitInit(10, 20);
         let code = codeOf ExplicitInit;
    }
}

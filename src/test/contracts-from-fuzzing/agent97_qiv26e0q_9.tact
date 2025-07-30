contract TrailingInit(param: Int,) {
    receive() {}
}

contract CallerTrailing {
    receive() {
         let state = initOf TrailingInit(55,);
         let code = codeOf TrailingInit;
    }
}

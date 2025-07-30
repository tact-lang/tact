contract LazyInit { }

contract TestLazyInit {
    receive() {
         let pkg = initOf LazyInit();
         let code = codeOf LazyInit;
    }
}

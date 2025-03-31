contract Lazy {}

contract TestLazyInit {
    receive() {
         // Using initOf for a contract without an explicit init() -> implicit empty init
         let pkg = initOf Lazy();
    }
}

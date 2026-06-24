fun myFun(_ : Int): Int { return 5; }

contract Test {
    receive() {
        let x = myFun(10);
        dump(x);
    }
}

message(42) MyMsg { val: Int; }

trait R1 {
    receive(msg: MyMsg) {
        dump(1);
    }
}

contract RC() with R1 {
    // This contract does not override the R1 receive(msg: MyMsg)
    // It does have a default receive handler
    receive() {
        dump(0);
    }
}

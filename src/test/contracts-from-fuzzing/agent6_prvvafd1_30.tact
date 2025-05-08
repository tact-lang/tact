extends mutates fun inc(self: Int) {
    self += 1;
}

contract MutateTest {
    receive() {
         let x = 10;
         x.inc();
         require(x == 11, "mutation failed");
         cashback(sender());
    }
}

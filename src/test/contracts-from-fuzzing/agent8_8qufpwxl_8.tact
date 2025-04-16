extends mutates fun inc(self: Int) {
    self = self + 1;
}

contract TestMutate {
    receive() {
         let a = 5;
         a.inc();
         let b = a; // expecting b to be 6 if mutation worked
         // We don't output, just compile the logic
         return;
    }
}

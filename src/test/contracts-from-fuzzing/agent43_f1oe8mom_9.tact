/// Extension mutation function that increments an Int by 1
extends mutates fun incr(self: Int) {
    self += 1;
}

contract TestMutateExtension() {
    receive() {
        let a = 10;
        a.incr();
        require(a == 11, "Expected 11");
        dump(a);
    }
}

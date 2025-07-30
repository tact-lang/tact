contract LoopTest {
    receive() {
        let r: Int = 0;
        repeat (5) {
            r += 1;
        }
        let acc: Int = 1;
        while (acc < 20) {
            acc += 3;
        }
        // Expected: r = 5, acc = 22, sum = 27
        dump(r + acc);
        cashback(sender());
    }
}

contract MapIterationTest {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(2, 10);
        m.set(5, 20);
        let sum: Int = 0;
        foreach (k, v in m) {
            sum += k;  
        }
        // Expected: keys 2 and 5, sum = 7
        dump(sum);
        cashback(sender());
    }
}

contract CellTest {
    receive() {
        let c: Cell = beginCell()
                         .storeUint(42, 8)
                         .endCell();
        let s: Slice = c.asSlice();
        let num: Int = s.loadUint(8);
        // Expected output: 42
        dump(num);
        cashback(sender());
    }
}

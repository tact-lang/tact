contract Test {
    receive() {
        // do...until loop: execute block until x becomes 0
        let x: Int = 5;
        let count: Int = 0;
        do {
            x -= 1;
            count += 1;
        } until (x == 0);
        dump(count);
    }
}

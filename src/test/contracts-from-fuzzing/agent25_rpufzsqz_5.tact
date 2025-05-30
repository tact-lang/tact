contract TestAugAssign {
    receive() {
        let x: Int = 5;
        x += 4;
        dump(x); // expected output: 9
    }
}

contract TestContract {
    receive() {
        let mut_x: Int = 3;
        while (mut_x > 0) {
            dump(mut_x);
            mut_x = mut_x - 1;
        }
    }
}

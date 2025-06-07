contract TestContract {
    receive() {
        let x: Int = 1;
        x += 2;
        dump(x);
    }
}

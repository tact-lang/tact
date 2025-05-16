contract TestWhile {
    receive() {
        let counter: Int = 3;
        while (counter > 0) {
            dump(counter);
            counter = counter - 1;
        }
    }
}

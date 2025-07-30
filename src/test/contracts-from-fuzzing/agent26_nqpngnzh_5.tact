contract TestIfValid {
    receive() {
        let x: Int = 10;
        if (x > 5) {
            dump(1);
        } else {
            dump(2);
        }
    }
}

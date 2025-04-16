contract Test {
    receive() {
        {
            let x: Int = 5;
            let y: Int = 6;
            dump(x + y);
        }
    }
}

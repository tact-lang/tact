contract TestBlock {
    receive() {
        {
            let a: Int = 2 + 2;
            dump(a);
        }
        {
            dump(3 + 3)
        }
    }
}

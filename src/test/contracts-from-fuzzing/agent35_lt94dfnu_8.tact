contract TestBlockSemicolonOptional {
    receive() {
        {
            let a: Int = 10;
            dump(a)
        }
    }
}

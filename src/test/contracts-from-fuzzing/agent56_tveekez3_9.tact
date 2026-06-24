contract TestBlockSemicolon {
    receive() {
        {
            let a: Int = 10; dump(a)
        }
    }
}

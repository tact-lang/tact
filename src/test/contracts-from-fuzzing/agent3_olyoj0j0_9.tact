fun test_block_stmts() : Int {
    {
        let x = 3;
        dump(x)
    }
    return 42;
}

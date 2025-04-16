contract TestBlock {
    receive() {
        { let x: Int = 5; dump(x); }
        { dump(10) } // block without trailing semicolon should compile fine
    }
}

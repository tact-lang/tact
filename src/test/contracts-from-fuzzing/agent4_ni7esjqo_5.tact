contract TestBlockValid {
    receive() {
        { let x: Int = 10; dump(x); }
    }
}

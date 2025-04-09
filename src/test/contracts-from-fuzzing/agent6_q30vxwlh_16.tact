contract TestBlockValid {
    receive() {
        { let x: Int = 5; dump(x); }
    }
}

contract TestBlockValid {
    receive() {
        { let a: Int = 5; dump(a); }
        { dump(7) }
    }
}

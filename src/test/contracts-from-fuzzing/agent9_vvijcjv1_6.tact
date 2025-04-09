contract TestBlockValid {
    receive() {
        { dump(1 + 1); }
        { dump(2 + 2) }
    }
}

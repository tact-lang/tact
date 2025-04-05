contract TestBlockValid {
    receive() {
        { dump(1); dump(2); }
        { dump(3) }
    }
}

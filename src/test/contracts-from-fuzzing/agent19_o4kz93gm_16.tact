contract TestBlockNoSemi {
    receive() {
         { dump(42) }
    }
}

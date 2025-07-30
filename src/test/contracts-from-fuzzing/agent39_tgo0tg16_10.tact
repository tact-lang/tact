contract TestStringLiteral {
    receive() {
        let commented: Cell = "Tact is awesome!".asComment();
        dump(commented);
    }
}

contract TestGetComment {
    s: String = "Hello World";

    receive() {}

    get fun getComment(): Cell {
        return self.s.asComment();
    }
}

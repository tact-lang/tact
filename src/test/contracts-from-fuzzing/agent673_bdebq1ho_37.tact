trait Tr {
    tval: Int;
}

contract UseTrait with Tr {
    tval: Int;
    init() {
        self.tval = 123;
    }
}
trait Tr {
    b: Bool;
}

contract InheritOpt with Tr {
    b: Bool;
    x: Int?;

    init() {
        self.b = false;
        self.x = null;
    }
}
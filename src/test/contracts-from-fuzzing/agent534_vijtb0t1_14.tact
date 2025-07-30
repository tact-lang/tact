struct NestOpt {
    val: Int?;
    another: Bool;
}

contract OuterOpt {
    field: NestOpt?;

    init() {
        self.field = null;
    }
}
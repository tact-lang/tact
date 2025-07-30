struct Simple {
    val: Int;
}

contract ImplicitNullOptStruct {
    data: Simple?;

    init() {
        self.data = null;
    }
}

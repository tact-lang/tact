struct Simple {
    x: Int;
    y: Int?;
}

contract HasOption {
    optField: Simple? = null;

    init() {}
}
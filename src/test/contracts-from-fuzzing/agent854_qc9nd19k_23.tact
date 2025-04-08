message MM {
    x: Int as uint32 = 123;
    y: Bool = true;
}

contract TestContract {
    data: MM = MM{};
    init() {}
}

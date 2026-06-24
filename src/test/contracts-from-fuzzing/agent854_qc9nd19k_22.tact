message MM {
    x: Int;
}

contract TestContract {
    msg: MM = MM{ x: 5 };
    init() {}
}

struct Info {
    id: Int as uint32;
    valid: Bool;
}

contract TestContract {
    info: Info? = null;

    receive() {}
}
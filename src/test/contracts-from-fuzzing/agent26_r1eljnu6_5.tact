fun returnBoolFromInt(): Bool {
    let value: Int = 1;
    let isNonZero: Bool = (value != 0);
    return isNonZero;
}

contract Test {
    receive() {
        returnBoolFromInt();
    }
}
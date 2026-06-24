message NumberHolder {
    value: Int;
}

message Account {
    holder: NumberHolder;
}

contract Test {
    receive() {
        // no usage
    }
}
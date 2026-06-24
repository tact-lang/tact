struct Box {
    value: Int;
}

message Container {
    box: Box?;
}

contract Test {
    receive() {
        // No usage needed
    }
}
message TextData {
    text: String
}

contract Test {
    receive(msg: TextData) {}
}
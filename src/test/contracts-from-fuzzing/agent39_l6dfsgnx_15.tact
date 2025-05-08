struct Box {
    data: Int?;
}

contract Test {
    receive() {
        let b: Box = Box{};
    }
}
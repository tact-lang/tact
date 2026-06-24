struct Wrapper {
    item: Int?;
}

contract Test {
    receive() {
        let w: Wrapper = Wrapper{item: null};
    }
}
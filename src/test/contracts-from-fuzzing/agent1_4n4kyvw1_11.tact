struct Data {
    value: Int?;
}

contract Test {
    receive() {
        let d1 = Data{value: 42};
        let d2 = Data{value: null};
    }
}
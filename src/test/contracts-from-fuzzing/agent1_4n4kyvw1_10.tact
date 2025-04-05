message Data {
    value: Int?;
}

contract Test {
    receive() {
        let d1 = Data{value: 10};
        let d2 = Data{value: null};
    }
}
struct Data {
    s: String;
}

contract Test {
    receive() {
        // Test using a struct with a string field
        let d: Data = Data { s: "Struct Test" };
    }
}

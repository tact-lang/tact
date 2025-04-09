struct Data {
    text: String;
}

contract Test {
    receive() {
        // Instantiate struct using instantiation syntax with curly brackets
        let d: Data = Data { text: "This is a string in a struct field" };
        
        // Use asSlice on the string field and compare equality
        if (d.text == "This is a string in a struct field") {
            let dummy: Int = d.text.asSlice().hashData();
        }
    }
}

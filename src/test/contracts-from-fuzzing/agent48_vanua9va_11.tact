struct Data {
    content: String;
}

contract Test {
    receive() {
        // Testing string literal usage in a struct
        let d: Data = Data { content: "Struct string: \n newline and \t tab, plus a Unicode smiley: \u263A" };
    }
}

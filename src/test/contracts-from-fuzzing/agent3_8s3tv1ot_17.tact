fun largeStringHash(): Int {
    let s: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non urna at erat placerat mollis. Phasellus scelerisque luctus nisl ac bibendum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.";
    // This string is definitely more than 127 bytes.
    return s.hashData();
}

contract Test {
    receive() {
        let h = largeStringHash();
    }
}

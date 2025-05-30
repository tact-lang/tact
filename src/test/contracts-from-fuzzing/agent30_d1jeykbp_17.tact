struct Reserved {
    sender: Int;
}

contract TestReserved {
    receive() {
        let r: Reserved = Reserved{ sender: 123 };
        r.sender;
    }
}

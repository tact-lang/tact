fun compareStrings(): Bool {
    return "abc" == "abc";
}

contract TestContract {
    receive() {
        let result: Bool = compareStrings();
    }
}

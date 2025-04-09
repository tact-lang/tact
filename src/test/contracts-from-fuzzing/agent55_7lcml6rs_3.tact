struct SingleField {
    a: Int;
}

contract TestContract {
    receive() {
        let s = SingleField{a: 5};
    }
}
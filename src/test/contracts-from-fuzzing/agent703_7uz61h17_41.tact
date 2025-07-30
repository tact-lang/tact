struct DefInner {
    x: Int = 42;
    y: Bool = true;
}

contract TestParamStructDefault(
    foo: Int,
    inn: DefInner
) {
    receive() {
        let _ = 1;
    }
}
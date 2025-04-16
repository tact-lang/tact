struct ContainsCode {
    code: Cell;
    d: Int;
}

contract StructWithCode {
    value: ContainsCode;

    init() {
        self.value = ContainsCode{
            code: myCode(),
            d: 42
        };
    }
}
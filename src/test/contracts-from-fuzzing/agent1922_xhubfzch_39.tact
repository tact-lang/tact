struct WithCode {
    code: Cell;
}

contract CellInStorage {
    val: WithCode;

    init() {
        self.val = WithCode{
            code: myCode()
        };
    }
}
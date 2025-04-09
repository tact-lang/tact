struct Complex {
    flag1: Bool;
    flag2: Bool;
    number: Int as uint32;
    text: String;
    payload: Cell;
}

contract TestContract {
    one: Complex;
    two: Complex;

    init() {
        self.one = Complex{
            flag1: true, flag2: false, number: 1, text: "A", payload: emptyCell()
        };
        self.two = Complex{
            flag1: false, flag2: true, number: 2, text: "B", payload: emptyCell()
        };
    }
}
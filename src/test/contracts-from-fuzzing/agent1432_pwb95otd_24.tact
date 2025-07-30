struct InnerRem {
    x: Int;
    trailing: Cell as remaining;
}

struct Outer {
    prefix: Int;
    embedded: InnerRem;
}

contract TestContract {
    payload: Outer;

    init() {
        self.payload = Outer{
            prefix: 7,
            embedded: InnerRem{ x: 42, trailing: emptyCell() }
        };
    }
}
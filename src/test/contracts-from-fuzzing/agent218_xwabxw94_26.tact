struct Rich {
    tonVal: Int as coins;
    maybeCell: Cell?;
}

contract RichStruct {
    r: Rich;

    init() {
        self.r = Rich{ tonVal: ton("10"), maybeCell: null };
    }
}
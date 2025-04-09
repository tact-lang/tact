struct HasBool {
    yes: Bool;
}

struct HasAddress {
    addr: Address;
}

struct HasCell {
    c: Cell;
}

contract ManyNestedTypes {
    hb: HasBool;
    ha: HasAddress;
    hc: HasCell;

    init() {
        self.hb = HasBool{ yes: true };
        self.ha = HasAddress{ addr: myAddress() };
        self.hc = HasCell{ c: emptyCell() };
    }
}
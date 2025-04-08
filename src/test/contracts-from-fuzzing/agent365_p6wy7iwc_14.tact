struct Sub {
    a: Int;
    b: Bool?;
    c: Cell;
}

contract MixStruct {
    data: Sub;
    init() {
        self.data = Sub{a:1, b:null, c:emptyCell()};
    }
}
struct Maximal {
    x1: Int;   x2: Bool;  x3: String; x4: Address; 
    x5: Cell;  x6: Slice; x7: Builder;
}

contract WideTypes {
    data: Maximal;

    init() {
        self.data = Maximal{
            x1: 1, x2: true, x3: "ok", x4: myAddress(), x5: emptyCell(), x6: emptyCell().asSlice(), x7: beginCell()
        };
    }
}
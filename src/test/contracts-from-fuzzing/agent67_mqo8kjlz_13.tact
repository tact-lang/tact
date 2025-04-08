struct Mixopt {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
    e: Cell;
    f: Address?;
}

contract TestContract {
    data: Mixopt;

    init() {
        self.data = Mixopt{
            a:123, b:null, c:"hi", d:null, e:emptyCell(), f:null
        };
    }
}
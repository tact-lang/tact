struct Jumbo {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
}

contract TestContract {
    bigField: Jumbo;

    init() {
        self.bigField = Jumbo{
            a: 1, b: true, c: 2, d: false,
            e: 3, f: true, g: 4, h: false,
            i: 5, j: true
        };
    }
    
    receive() {
        self.bigField = Jumbo{
            a: 11, b: false, c: 12, d: true,
            e: 13, f: false, g: 14, h: true,
            i: 15, j: false
        };
    }
}
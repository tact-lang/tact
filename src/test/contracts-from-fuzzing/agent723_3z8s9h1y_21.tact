struct Big {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; g: Cell; h: Cell?; i: Address; j: Address?;
    k: Int; l: Bool; m: String; n: Int?; o: Bool?; p: String?; q: Cell; r: Cell?; s: Address; t: Address?;
    aa: Int; bb: Bool; cc: String; dd: Int?; ee: Bool?; ff: String?; gg: Cell; hh: Cell?; ii: Address; jj: Address?;
}

contract TestContract {
    big: Big;

    init() {
        self.big = Big{
            a: 1, b: true, c: "one", d: null, e: false, f: "two", g: emptyCell(), h: emptyCell(), i: myAddress(), j: null,
            k: 2, l: false, m: "three", n: 5, o: null, p: null, q: emptyCell(), r: null, s: myAddress(), t: null,
            aa: 42, bb: true, cc: "four", dd: null, ee: null, ff: null, gg: emptyCell(), hh: emptyCell(), ii: myAddress(), jj: null
        };
    }
}
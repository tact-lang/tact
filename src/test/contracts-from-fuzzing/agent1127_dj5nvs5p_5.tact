struct ManyFields {
  a: Int; b: Int; c: Int; d: Int; e: Int;
  f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
  k: String; l: String; m: String; n: String; o: String;
}

contract Test {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a: 1, b: 2, c: 3, d: 4, e: 5,
            f: true, g: false, h: true, i: false, j: true,
            k: "k", l: "l", m: "m", n: "n", o: "o",
        };
    }
}

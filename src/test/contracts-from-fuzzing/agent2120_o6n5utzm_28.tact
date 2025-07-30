struct Ints { a: Int; b: Int; c: Int }
struct Bools { x: Bool; y: Bool }
struct Strings { s1: String; s2: String }

contract GroupedFields {
    ints: Ints;
    bools: Bools;
    strings: Strings;

    init() {
        self.ints = Ints{ a:1, b:2, c:3 };
        self.bools = Bools{ x:true, y:false };
        self.strings = Strings{ s1:"a", s2:"b" };
    }
}
struct OptInt {
    a: Int?;
}

struct OptBool {
    a: Bool?;
}

struct OptString {
    a: String?;
}

struct OptCell {
    a: Cell?;
}

struct OptSlice {
    a: Slice?;
}

contract OptionalCombinations {
    i: OptInt;
    b: OptBool;
    s: OptString;
    c: OptCell;
    sl: OptSlice;

    init() {
        self.i = OptInt{a:null};
        self.b = OptBool{a:null};
        self.s = OptString{a:null};
        self.c = OptCell{a:null};
        self.sl = OptSlice{a:null};
    }
}
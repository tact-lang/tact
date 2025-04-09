struct Alpha { 
    x: Int; 
    y: Bool;
}

struct Beta {
    flag: Bool;
    note: String;
}

struct Gamma {
    p: Address;
    q: Slice;
}

contract MultiStruct {
    a: Alpha;
    b: Beta;
    c: Gamma;

    init() {
        self.a = Alpha{ x: 1, y: false };
        self.b = Beta{ flag: true, note: "hi" };
        self.c = Gamma{ p: myAddress(), q: emptyCell().asSlice() };
    }
}
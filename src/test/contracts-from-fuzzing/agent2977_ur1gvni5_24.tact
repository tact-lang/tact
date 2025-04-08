struct Mix {
    a: Int;
    b: Bool?;
    c: String?;
    d: Slice;
}

contract MixVariation {
    m: Mix;
    init() {
        self.m = Mix{ a:10, b:null, c:null, d:emptyCell().asSlice() };
    }
}
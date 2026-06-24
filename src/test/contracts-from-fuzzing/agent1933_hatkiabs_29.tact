struct Sub {
    inner: String;
}

struct Top {
    a: Int;
    sub: Sub?;
}

contract TopNullSub {
    data: Top;
    init() {
        self.data = Top{ a:1, sub:null };
    }
}
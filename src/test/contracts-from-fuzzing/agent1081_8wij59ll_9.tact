struct Sub1 {
    x: Int;
    y: String?;
}

struct Sub2 {
    sub: Sub1?;
    txt: String;
}

contract MultiOption {
    f: Sub2?;
    
    init() {
        self.f = Sub2{
            sub: Sub1{ x: 5, y: null },
            txt: "hi"
        };
    }
}
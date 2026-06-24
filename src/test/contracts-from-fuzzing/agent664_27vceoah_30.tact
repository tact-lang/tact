struct SPacked {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrapping {
    inner: SPacked;
}

contract WrapStructs {
    data: Wrapping;

    init() {
        self.data = Wrapping{ inner: SPacked{a:1,b:true,c:"hi"} };
    }
}

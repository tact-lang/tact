struct Middle {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrapper {
    m: Middle;
    s: String;
}

contract OptionalStructWrapper {
    inner: Wrapper?;

    init() {
        self.inner = Wrapper{
            m: Middle{a:5,b:true,c:"hi"},
            s: "top"
        };
    }
}
struct Mid{
    a: Int;
    b: Bool?;
    c: String;
}

struct Wrapper {
    first: Mid;
    second: Mid;
}

contract Test {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            first: Mid{ a:1, b:null, c:"x" },
            second: Mid{ a:2, b:true, c:"y" },
        };
    }
}
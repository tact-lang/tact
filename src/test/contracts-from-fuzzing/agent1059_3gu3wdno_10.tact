struct Sopt {
    a: Int?;
    b: String?;
}

struct Container {
    one: Sopt;
    two: Sopt;
    three: Sopt;
}

contract NestedOpts {
    data: Container;
    init() {
        self.data = Container{
            one: Sopt{ a:null, b:null },
            two: Sopt{ a:null, b:null },
            three: Sopt{ a:null, b:null }
        };
    }
}
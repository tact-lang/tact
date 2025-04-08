struct Sub {
    value: Int?;
}
struct Outer {
    sub1: Sub?;
    sub2: Sub?;
}

contract TestOpt {
    data: Outer;
    init() {
        self.data = Outer{
            sub1: null,
            sub2: Sub{ value: 42 }
        };
    }
}
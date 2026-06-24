struct Inner {
    a: Int?;
    b: String?; 
}

contract TestContract {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = Inner{
            a: 42,
            b: null,
        };
    }
}
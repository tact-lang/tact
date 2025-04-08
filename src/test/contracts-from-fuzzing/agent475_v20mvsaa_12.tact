struct DeepOptional {
    a: Int?;
    b: Bool?;
}

struct Wrap1 {
    inner: DeepOptional?;
}

struct Wrap2 {
    inner: Wrap1?;
}

contract TestContract {
    data: Wrap2;

    init() {
        self.data = Wrap2{
            inner: Wrap1{
                inner: DeepOptional{
                    a: 3,
                    b: false,
                }
            }
        };
    }

    receive() {}
}
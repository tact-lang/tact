struct ContainsInnerOpt {
    inner: Int?;
}

struct Wrapper {
    data: ContainsInnerOpt;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            data: ContainsInnerOpt{inner:null}
        };
    }
}

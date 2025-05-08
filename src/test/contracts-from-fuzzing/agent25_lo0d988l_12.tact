struct OptInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainingOpt {
    inner: OptInStruct?;
}

contract TestContract {
    container: ContainingOpt;

    init() {
        self.container = ContainingOpt{
            inner: null
        };
    }
}
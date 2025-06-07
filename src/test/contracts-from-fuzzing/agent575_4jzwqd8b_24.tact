struct MultiOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestContract {
    data: MultiOpt;

    init() {
        self.data = MultiOpt{
            a:null, b:1, c:null, d:2, e:null
        };
    }
}

struct BoolsOnly {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract BoolsOnlyContract {
    data: BoolsOnly;

    init() {
        self.data = BoolsOnly{
            a:true,
            b:false,
            c:true,
            d:false
        };
    }
}
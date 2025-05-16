struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptionContract {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}

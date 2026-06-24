struct LotsOfOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract TestContract {
    val: LotsOfOpt;

    init() {
        self.val = LotsOfOpt{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}
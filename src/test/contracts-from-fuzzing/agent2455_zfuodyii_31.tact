struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Slice?;
}

contract MultiOptField {
    val: MultiOpt;

    init() {
        self.val = MultiOpt{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}
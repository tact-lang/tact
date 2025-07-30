struct ManyOpt {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Int?;
    o5: Bool?;
}

contract SeveralOpts {
    val: ManyOpt;

    init() {
        self.val = ManyOpt{
            o1: null, o2: null, o3: null, o4: null, o5: null
        };
    }
}
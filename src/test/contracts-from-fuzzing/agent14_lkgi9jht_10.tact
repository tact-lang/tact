struct DefaultMix {
    ia: Int = 5;
    ib: Int?;           // implicit null
    ba: Bool = true;
    bb: Bool?;          // implicit null
    sa: String = "abc";
    sb: String?;        // implicit null
}

contract TestContract {
    rec: DefaultMix;

    init() {
        self.rec = DefaultMix{
            ib: null,
            bb: false,
            sb: null,
        };
    }
}
struct MultiWrapOpt {
    first: Int?;
    second: Bool?;
    third: String?;
}

contract MultiWrapOptTest {
    wrap: MultiWrapOpt;

    init() {
        self.wrap = MultiWrapOpt{ first:null, second:null, third:null };
    }
}
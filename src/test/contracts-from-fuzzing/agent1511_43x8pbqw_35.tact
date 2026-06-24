struct OnlyOneOpt {
    x: Int?;
}

contract OnlyOneOptTest {
    y: OnlyOneOpt;
    init() {
        self.y = OnlyOneOpt{ x:null };
    }
}
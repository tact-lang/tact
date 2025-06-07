struct JustBoolOpt {
    flag: Bool?;
}

contract OnlyBoolOptTest {
    data: JustBoolOpt;

    init() {
        self.data = JustBoolOpt{ flag: null };
    }
}
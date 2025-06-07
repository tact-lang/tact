struct FilledOpt {
    s: String? = "preset";
}

contract FilledOptTest {
    data: FilledOpt = FilledOpt{};

    init() {
        self.data = FilledOpt{ s: null };
    }
}
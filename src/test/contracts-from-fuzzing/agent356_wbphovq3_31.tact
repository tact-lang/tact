struct HasBoolOpt {
    x: Bool?;
    y: Bool?;
}

contract OptBoolTest {
    data: HasBoolOpt;

    init() {
        self.data = HasBoolOpt{
            x: null,
            y: null
        };
    }
}
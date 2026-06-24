struct SingleOptional {
    item: Int?;
}

contract SingleOpt {
    state: SingleOptional;

    init() {
        self.state = SingleOptional{
            item: null
        };
    }
}
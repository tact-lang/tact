struct WrapOpt {
    v: Int?;
}

contract WrapOptContract {
    state: WrapOpt;

    init() {
        self.state = WrapOpt{ v:null };
    }
}
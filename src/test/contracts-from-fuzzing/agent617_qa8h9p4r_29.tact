struct OnlyOpt {
    item: Int?;
}

contract OnlyOptField {
    data: OnlyOpt;
    init() {
        self.data = OnlyOpt{ item: null };
    }
}
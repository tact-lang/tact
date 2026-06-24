struct OptionWrapped {
    inner: Int?;
}

contract ChangeWrapped {
    w: OptionWrapped = OptionWrapped{ inner: null };

    init() {
        self.w = OptionWrapped{ inner: 55 };
    }
}
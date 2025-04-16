struct EmptyTextOpt {
    text: String?;
}

contract InitEmptyOpt {
    val: EmptyTextOpt;
    init() {
        self.val = EmptyTextOpt{ text: null };
    }
}
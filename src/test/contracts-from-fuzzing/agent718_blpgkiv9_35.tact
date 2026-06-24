struct SmallOptional {
    x: Int?;
}

contract SmallOptionalContract {
    val: SmallOptional?;
    init() {
        self.val = null;
    }
}
struct NestedOptional {
    val: Int?;
}

contract NestedOptStructInStorage {
    data: NestedOptional?;
    init() {
        self.data = null;
    }
    receive() {
        if (self.data != null) {
            let _ = self.data!!;
        }
    }
}
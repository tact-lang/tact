struct ContainStr {
    s: String?;
}

contract StringNullTest {
    val: ContainStr;
    init() {
        self.val = ContainStr{ s:null };
    }
}
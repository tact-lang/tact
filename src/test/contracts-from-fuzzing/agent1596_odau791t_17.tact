struct MultiNestedOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    m: MultiNestedOpt?;
    s: String?;
}

contract MultiLevelNestedOpt {
    val: OuterOpt = OuterOpt{ m: null, s: null };
    receive() {
        let _ = self.val.s;
    }
}
struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct NestedOptional {
    inner: DeeplyOptional?;
}

contract TestContract {
    val: NestedOptional?;

    init() {
        self.val = NestedOptional{ inner: DeeplyOptional{ a:null, b:true, c:"a", d:null } };
    }
}
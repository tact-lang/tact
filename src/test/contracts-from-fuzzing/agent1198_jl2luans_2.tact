struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrap {
    inner: NestedOptional?;
}

contract TestStorage {
    state: Wrap;
    
    init() {
        self.state = Wrap{ inner: null };
    }
}
struct InnerMost { 
    b: Bool; 
}

struct Mid { 
    inner: InnerMost; 
    val: Int; 
}

struct ContainsManyNested {
    m1: Mid;
    m2: Mid;
    m3: Mid;
}

contract NestedStructsWide {
    data: ContainsManyNested;

    init() {
        let mid = Mid{ inner: InnerMost{ b: true }, val: 5 };
        self.data = ContainsManyNested{ m1: mid, m2: mid, m3: mid };
    }
}
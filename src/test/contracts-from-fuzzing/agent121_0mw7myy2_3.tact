struct SubLevel {
    inner: Int = 7;
}

struct OuterLevel {
    nested: SubLevel;
    flag: Bool = true;
}

contract MultiNested {
    complex: OuterLevel;

    init() {
        self.complex = OuterLevel{
            nested: SubLevel{ inner: 99 },
            flag: false,
        };
    }
}
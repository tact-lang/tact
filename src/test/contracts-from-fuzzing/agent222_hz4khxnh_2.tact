struct InnerNested {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

struct OuterNested {
    x: Int = 0;
    y: InnerNested;
}

contract NestedPersistence {
    data: OuterNested = OuterNested{x: 42, y: InnerNested{a: 5, b: false, c: "hey"}};
    
    receive() {
        self.data = OuterNested{x: 100, y: InnerNested{a: 7, b: true, c: "zzz"}};
    }
}
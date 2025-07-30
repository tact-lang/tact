struct InnerMost { a: Int; }
struct InnerLevel { nested: InnerMost; }
struct MiddleLevel { nested: InnerLevel; }
struct OuterLevel { nested: MiddleLevel; }

contract ManyNested {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{ nested: MiddleLevel{ nested: InnerLevel{ nested: InnerMost{ a: 123 } } } };
    }
}

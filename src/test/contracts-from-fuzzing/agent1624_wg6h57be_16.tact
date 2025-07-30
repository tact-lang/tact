struct OneLevel { val: Int?; }

struct TwoLevel { nested: Int?; }

contract TwoNestedOptionals {
    first: OneLevel;
    second: TwoLevel;

    init() {
        self.first = OneLevel{ val: null };
        self.second = TwoLevel{ nested: null };
    }
}
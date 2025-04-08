struct DoublyNested {
    value: Int;
}

struct MidLevel {
    nested: DoublyNested;
}

contract NestedStructField {
    middle: MidLevel;

    init() {
        self.middle = MidLevel{
            nested: DoublyNested{ value: 123 } 
        };
    }
}
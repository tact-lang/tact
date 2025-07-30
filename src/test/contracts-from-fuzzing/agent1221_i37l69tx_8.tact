struct MultipleOptionals {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Builder?;
    f: Address?;
}

contract ManyOptStruct {
    value: MultipleOptionals;

    init() {
        self.value = MultipleOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}
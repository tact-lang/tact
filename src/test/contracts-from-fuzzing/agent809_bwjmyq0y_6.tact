struct Inner1 { val1: Int; }
struct Inner2 { val2: Bool; }
struct NestedStruct {
    one: Inner1;
    two: Inner2;
}

contract NestedStructContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            one: Inner1{ val1: 42 },
            two: Inner2{ val2: true }
        };
    }
}
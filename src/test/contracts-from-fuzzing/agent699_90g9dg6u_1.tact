struct Nested1 { val1: Int; val2: Bool; }
struct Nested2 { nested1: Nested1; val3: String; val4: Bool; }

contract TestContract {
    storageField: Nested2;

    init() {
        self.storageField = Nested2{
            nested1: Nested1{ val1: 1, val2: false },
            val3: "hello",
            val4: true
        };
    }
}

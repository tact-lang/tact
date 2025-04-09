// Forward declaration of struct before contract
struct SomeData {
    foo: Int;
    bar: Int?;
}

contract NestedOptionalTest {
    data: SomeData;

    init() {
        self.data = SomeData { foo: 123, bar: null };
    }

    get fun getBar(): Int? {
        return self.data.bar;
    }
}
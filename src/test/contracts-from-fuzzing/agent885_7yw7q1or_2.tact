struct Inner { a: Int; b: Bool }

struct Outer { foo: Int; nested: Inner; bar: Bool }

contract DeepNested {
    myData: Outer;

    init() {
        self.myData = Outer{
            foo: 10,
            nested: Inner{ a: 5, b: true },
            bar: false
        };
    }
}

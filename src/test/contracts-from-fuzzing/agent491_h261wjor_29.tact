struct Foo { value: Int; }
struct Bar { foo: Foo; }

contract BigInitializer {
    arr1: Bar;
    arr2: Bar;
    arr3: Bar;
    arr4: Bar;
    arr5: Bar;
    init() {
        self.arr1 = Bar{ foo: Foo{ value: 1 } };
        self.arr2 = Bar{ foo: Foo{ value: 2 } };
        self.arr3 = Bar{ foo: Foo{ value: 3 } };
        self.arr4 = Bar{ foo: Foo{ value: 4 } };
        self.arr5 = Bar{ foo: Foo{ value: 5 } };
    }
}
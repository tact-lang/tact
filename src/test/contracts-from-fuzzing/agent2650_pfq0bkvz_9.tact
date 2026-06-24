struct NestedNullable {
    innerStruct: Inner?;
}

struct Inner {
    foo: Foo?;
}

struct Foo {
    bar: Int?;
    baz: Bool?;
}

contract StorageTest {
    data: NestedNullable;

    init() {
        self.data = NestedNullable{
            innerStruct: Inner{
                foo: Foo{ bar:null, baz:true }
            }
        };
    }
}
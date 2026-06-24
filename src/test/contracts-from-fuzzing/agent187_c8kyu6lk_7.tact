struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
    c: String;
}

struct Union {
    f1: Inner1;
    f2: Inner2;
}

contract StorageUnionFieldsTest {
    data: Union;

    init() {
        self.data = Union{
            f1: Inner1{a: 7},
            f2: Inner2{b:true,c:"hello"}
        };
    }
}
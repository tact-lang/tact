struct InnerA {
    field1: Int;
}

struct InnerB {
    innerA: InnerA;
    field2: Int;
}

struct Container {
    innerB: InnerB;
    extra: Int;
}

contract TestContract {
    myField: Container = Container{
        innerB: InnerB{
            innerA: InnerA{field1: 42},
            field2: 43
        },
        extra: 44
    };

    receive() {
        let _ = self.myField;
    }
}
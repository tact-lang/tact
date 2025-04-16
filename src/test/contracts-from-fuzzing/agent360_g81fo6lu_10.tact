struct SubStruct {
    foo: Int;
    bar: Bool;
}

struct Container1 {
    val: SubStruct;
}

struct Container2 {
    val: SubStruct;
}

contract TestContract {
    cont1: Container1;
    cont2: Container2;

    init() {
        self.cont1 = Container1{ val: SubStruct{ foo: 10, bar: true } };
        self.cont2 = Container2{ val: SubStruct{ foo: 20, bar: false } };
    }
}
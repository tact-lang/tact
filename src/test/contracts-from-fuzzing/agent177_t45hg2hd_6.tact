struct InnerA {
    a: Int = 1;
}

struct InnerB {
    b: Bool = true;
}

struct Container {
    embeddedA: InnerA;
    embeddedB: InnerB;
    s: String = "test";
    flag: Bool = false;
}

contract ComplexFieldsContract {
    container: Container;
    intVal: Int = 123;
    strVal: String = "hello";
    boolVal: Bool = true;
    addrVal: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.container = Container{
            embeddedA: InnerA{ a: 777 },
            embeddedB: InnerB{ b: false },
            s: "deep",
            flag: true
        };
        self.intVal = 1000;
        self.strVal = "world";
        self.boolVal = false;
        self.addrVal = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
    
    receive(){}
}
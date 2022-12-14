
struct SomeGenericStruct {
    value1: Int;
    value2: Int;
    value3: Int;
    value4: Int;
    value5: Int;
}

struct StructWithOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: SomeGenericStruct?;
}

contract ContractWithOptionals {

    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: SomeGenericStruct?;

    init() {
        // Nothing to do
    }

    get fun isNotNullA(): Bool {
        return self.a != null;
    }
    get fun isNotNullB(): Bool {
        return self.b != null;
    }
    get fun isNotNullC(): Bool {
        return self.c != null;
    }
    get fun isNotNullD(): Bool {
        return self.d != null;
    }
    get fun isNotNullE(): Bool {
        return self.e != null;
    }

    get fun notNullA(): Int {
        return self.a!!;
    }

    get fun notNullB(): Bool {
        return self.b!!;
    }

    get fun notNullC(): Cell {
        return self.c!!;
    }

    get fun notNullD(): Address {
        return self.d!!;
    }

    get fun notNullE(): SomeGenericStruct {
        return self.e!!;
    }
}
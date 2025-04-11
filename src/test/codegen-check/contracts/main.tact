struct A {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Int;
    g: Int;
}

struct B {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Int;
    g: Int;
}

struct C {
    a: Cell;
    b: Cell?;
    c: Slice?;
    d: Slice?;
    e: Bool;
    f: Int;
    g: Int;
    h: Address;
}

contract MainContract {
    get fun testAugmentedAssignOperators(intVal: Int, intVal2: Int, boolVal: Bool, boolVal2: Bool): Int {
        let a = intVal;

        a += intVal2;
        a -= intVal2;

        let b = boolVal;

        b &&= boolVal2;
        b ||= boolVal2;

        return a + (b ? 10 : 20);
    }

    get fun writeSerializationForA(): A {
        return A {
            a: 1,
            b: 2,
            c: null,
            d: false,
            e: true,
            f: 3,
            g: 4
        }
    }

    get fun writeSerializationForB(): B {
        return B {
            a: 1,
            b: 2,
            c: null,
            d: false,
            e: null,
            f: 3,
            g: 4
        }
    }

    get fun writeSerializationForC(): C {
        return C {
            a: beginCell().storeInt(0, 32).endCell(),
            b: null,
            c: null,
            d: null,
            e: true,
            f: 1,
            g: 2,
            h: myAddress()
        }
    }
}

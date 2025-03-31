import "./optionals-2.tact";
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

message Update {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: SomeGenericStruct?;
    f: StructWithOptionals?;
}

contract ContractWithOptionals {

    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: SomeGenericStruct?;
    f: StructWithOptionals?;

    init(a: Int?, b: Bool?, c: Cell?, d: Address?, e: SomeGenericStruct?, f: StructWithOptionals?) {
        self.a = a;
        self.b = b;
        self.c = c;
        self.d = d;
        self.e = e;
        self.f = f;

        // abi.dump(self.a);
        // abi.dump(self.b);
        // abi.dump(self.c);
        // abi.dump(self.d);
        // abi.dump(self.e);
        // abi.dump(self.f);
    }

    receive() {
        // Deploy
    }

    receive(msg: Update) {
        self.a = msg.a;
        self.b = msg.b;
        self.c = msg.c;
        self.d = msg.d;
        self.e = msg.e;
        self.f = msg.f;

        // abi.dump(self.a);
        // abi.dump(self.b);
        // abi.dump(self.c);
        // abi.dump(self.d);
        // abi.dump(self.e);
        // abi.dump(self.f);
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
    get fun isNotNullF(): Bool {
        return self.f != null;
    }

    get fun nullA(): Int? {
        return self.a;
    }

    get fun nullB(): Bool? {
        return self.b;
    }

    get fun nullC(): Cell? {
        return self.c;
    }

    get fun nullD(): Address? {
        return self.d;
    }

    get fun nullE(): SomeGenericStruct? {
        return self.e;
    }

    get fun nullF(): StructWithOptionals? {
        return self.f;
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

    get fun notNullF(): StructWithOptionals {
        // abi.dump(self.a);
        // abi.dump(self.b);
        // abi.dump(self.c);
        // abi.dump(self.d);
        // abi.dump(self.e);
        // abi.dump(self.f);
        return self.f!!;
    }

    get fun testVariables(): SomeGenericStruct {
        let a: SomeGenericStruct? = SomeGenericStruct{value1: 1, value2: 2, value3: 3, value4: 4, value5: 5};
        return a!!;
    }
}
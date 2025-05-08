// Test: Getter returning a primitive value
contract TestPrimitive {
    x: Int = 42;

    receive() {}

    get fun getX(): Int {
        return self.x;
    }
}

// Test: Getter returning a struct (composite type)
struct Pair {
    a: Int;
    b: Int;
}

contract TestStruct {
    pair: Pair;

    init() {
        self.pair = Pair{
            a: 10,
            b: 20
        };
    }

    receive() {}

    get fun getPair(): Pair {
        return self.pair;
    }
}

// Test: Getter with a parameter accessing a map
contract TestMap {
    mapField: map<Int, Int>;

    init() {
        self.mapField = emptyMap();
        self.mapField.set(1, 100);
    }

    receive() {}

    get fun getValue(key: Int): Int? {
        return self.mapField.get(key);
    }
}

// Test: Getter returning a slice from a stored cell
contract TestSlice {
    someCell: Cell;

    init() {
        self.someCell = beginCell().storeUint(42, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.someCell.beginParse();
    }
}

// Test: Getter returning an optional struct
struct MaybePair {
    a: Int;
    b: Int;
}

contract TestOptionalStruct {
    maybePair: MaybePair? = null;

    receive() {}

    get fun getMaybePair(): MaybePair? {
        return self.maybePair;
    }
}

// Test: Getter returning a Boolean value
contract TestBool {
    flag: Bool = true;

    receive() {}

    get fun getFlag(): Bool {
        return self.flag;
    }
}

// Test: Getter returning a nested struct
struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: Inner{
                i: 99
            }
        };
    }

    receive() {}

    get fun getNested(): Outer {
        return self.outer;
    }
}

// Test: Getter that modifies state (modification not persisted)
contract TestGetterModify {
    x: Int = 100;

    receive() {}

    get fun getModified(): Int {
        // Although this adds 10 to x during getter call,
        // the change is not persisted in the contract's state
        self.x += 10;
        return self.x;
    }
}

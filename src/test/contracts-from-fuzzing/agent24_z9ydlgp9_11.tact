// Test 1: Basic getter returning a primitive value (Int)
contract TestPrimitiveGetter {
    value: Int = 42;

    receive() {}

    get fun getValue(): Int {
        return self.value;
    }
}

// Test 2: Getter returning a composite type (struct)
struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStructGetter {
    ms: MyStruct = MyStruct { a: 10, b: true };

    receive() {}

    get fun getStruct(): MyStruct {
        return self.ms;
    }
}

// Test 3: Getter modifying state (allowed; state modifications are not persisted)
contract TestModifyGetter {
    v: Int = 5;
    
    receive() {}

    get fun test(): Int {
        self.v += 1;
        return self.v;
    }
}

// Test 4: Getter returning an optional from a map (accessing a non-existent key)
contract TestMapGetter {
    m: map<Int, Int> = emptyMap();

    receive() {}

    get fun getMissing(): Int? {
        return self.m.get(1);
    }
}

// Test 5: Getter returning a Cell value (with state initialization in init because constant evaluation of endCell() is not supported)
contract TestCellGetter2 {
    c: Cell;
    
    init() {
        self.c = beginCell().storeUint(123, 32).endCell();
    }
    
    receive() {}
    
    get fun getCell(): Cell {
        return self.c;
    }
}

// Test 6: Getter returning an optional primitive (Int?) with a null value
contract TestOptionalGetter {
    receive() {}

    get fun getOptional(): Int? {
        return null;
    }
}

// Test 7: Getter returning a tuple as a struct (optional)
struct MyTuple {
    a: Int;
    b: Int;
}

contract TestTupleGetter {
    receive() {}

    get fun getTuple(): MyTuple? {
        return MyTuple { a: 1, b: 2 };
    }
}

// Test 8: Getter returning a nested composite structure
struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: String;
}

contract TestNestedGetter {
    state: Outer = Outer { inner: Inner { x: 99, y: false }, z: "hello" };

    receive() {}

    get fun getNested(): Outer {
        return self.state;
    }
}

// Test 1: Primitive getter
contract TestPrimitive {
    state: Int = 42;

    // Getter returning a primitive Int
    get fun getValue(): Int {
        return self.state;
    }

    // Receive function to trigger full contract compilation
    receive() {}
}

// Test 2: Getter returning a struct
struct MyStruct {
    x: Int;
    y: Int;
}

contract TestGetterStruct2 {
    value: Int = 100;

    // Getter returning a struct based on MyStruct
    get fun getStruct(): MyStruct {
        return MyStruct {
            x: self.value,
            y: self.value + 1
        };
    }

    receive() {}
}

// Test 3: Getter with optional return type
contract TestGetterOptional {
    value: Int = 7;

    // Getter returning an optional Int based on a condition
    get fun getOptionalValue(): Int? {
        if (self.value > 10) {
            return self.value;
        } else {
            return null;
        }
    }

    receive() {}
}

// Test 4: Getter returning a persistent map
contract TestGetterMap2 {
    // Persistent state variable of type map<Int, Int>, maps are empty by default
    m: map<Int, Int>;

    // Getter returning the entire map
    get fun getMap(): map<Int, Int> {
        return self.m;
    }

    receive() {}
}

// Test 5: Getter returning a runtime cell
contract TestGetterCell2 {
    // Getter that creates and returns a Cell at runtime
    get fun getCell(): Cell {
        return beginCell().storeUint(123, 32).endCell();
    }

    receive() {}
}

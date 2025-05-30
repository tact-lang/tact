// Struct with Address and lots of Int optional fields, nested
struct Nested {
    addr: Address;
    val1: Int?;
    val2: Int?;
    val3: Int?;
    val4: Int?;
    val5: Int?;
}

struct Outer {
    nested: Nested;
    count: Int = 0;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            nested: Nested{
                addr: myAddress(),
                val1: null, val2: null, val3: null, val4: null, val5: null
            },
            count: 5
        };
    }

    receive() {
        self.o = self.o;
    }
}
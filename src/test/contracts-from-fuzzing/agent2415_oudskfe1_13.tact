struct InnerMost {
    val: Int;
}

struct Nested2 {
    inner: InnerMost; 
}

struct Nested1 {
    nest2: Nested2;
}

contract Layered {
    deepField: Nested1;

    init() {
        self.deepField = Nested1{
            nest2: Nested2{
                inner: InnerMost{ val: 7 }
            }
        };
    }
}
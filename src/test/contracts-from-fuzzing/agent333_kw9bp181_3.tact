struct Nested3 { val3: Int; }
struct Nested2 { val2: Nested3; }
struct Nested1 { val1: Nested2; }

contract TestContract {
    data: Nested1;

    init() {
        self.data = Nested1{
            val1: Nested2{
                val2: Nested3{ val3: 42 }
            }
        };
    }
}
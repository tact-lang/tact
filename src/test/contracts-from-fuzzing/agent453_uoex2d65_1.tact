struct Inner1 {
    val1: Int;
    val2: Bool;
}

struct Inner2 {
    val3: String;
    val4: Int?;
}

struct Outer {
    nested1: Inner1;
    nested2: Inner2;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner1{
                val1: 1,
                val2: true,
            },
            nested2: Inner2{
                val3: "hello",
                val4: null,
            }
        };
    }
}

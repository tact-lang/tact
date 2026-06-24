struct Nested1 {
    inner: Nested2;
}

struct Nested2 {
    inner: Nested3;
}

struct Nested3 {
    inner: Nested4;
}

struct Nested4 {
    inner: Nested5;
}

struct Nested5 {
    val: Int;
}

contract FiveDeep {
    data: Nested1;

    init() {
        self.data = Nested1{
            inner: Nested2{
                inner: Nested3{
                    inner: Nested4{
                        inner: Nested5{
                            val: 77
                        }
                    }
                }
            }
        };
    }
}
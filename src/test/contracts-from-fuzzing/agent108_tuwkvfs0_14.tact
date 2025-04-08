struct A { inner: B; flag: Bool; }
struct B { inner: C; val: Int; }
struct C { inner: D; text: String; }
struct D { deepVal: Int?; }

contract Test13 {
    data: A;

    init() {
        self.data = A{
            inner: B{
                inner: C{
                    inner: D{
                        deepVal: null
                    },
                    text: "hello"
                },
                val: 123
            },
            flag: true
        };
    }
}
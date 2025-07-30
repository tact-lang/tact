struct Inner1 {
    val: Int;
}

struct Inner2 {
    inside: Inner1;
}

struct Inner3 {
    again: Inner2;
}

struct Inner4 {
    more: Inner3;
}

contract Nest4 {
    deep: Inner4;

    init() {
        self.deep = Inner4{
            more: Inner3{
                again: Inner2{
                    inside: Inner1{
                        val: 123,
                    },
                },
            },
        };
    }
}
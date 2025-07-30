struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
    inner1: Inner1;
}

struct Inner3 {
    z: Int;
    inner2: Inner2;
}

contract MultiNested {
    value: Inner3;

    init() {
        self.value = Inner3{
            z:100,
            inner2:Inner2{
                y:50,
                inner1:Inner1{
                    x:25,
                },
            },
        };
    }

    receive() {}
}
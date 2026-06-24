struct Inner {
    deep: Inner2;
}

struct Inner2 {
    deep: Inner3;
}

struct Inner3 {
    deep: Inner4;
}

struct Inner4 {
    val: Int;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            deep: Inner2{
                deep: Inner3{
                    deep: Inner4{ val: 123 }
                }
            }
        };
    }
}
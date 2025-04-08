message(42) M {
    val: Int;
}

struct Container {
    m: M?;
    info: String;
}

contract TestContract {
    c: Container? = null;

    init() {
        self.c = Container{
            m: M{val: 7},
            info: "test"
        };
    }
}
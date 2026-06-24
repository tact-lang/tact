message(123) M { v: Int }

struct Container {
    val: Int;
    msg: M;
}

contract TestContract {
    cont: Container = Container{ val: 1, msg: M{ v: 2 } };

    init() {
        self.cont = Container{ val: 1, msg: M{ v: 99 } };
    }
}
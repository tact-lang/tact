struct Sub {
    n: Int = 5;
}

struct Container {
    s: Sub;
}

contract TestContract {
    data: Container = Container{ s: Sub{} };
}

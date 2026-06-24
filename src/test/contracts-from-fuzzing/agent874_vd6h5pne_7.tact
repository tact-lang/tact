struct Sub {
    id: Int;
}

struct Wrapper {
    first: Sub;
    second: Sub;
    third: Sub;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            first: Sub{ id: 1 },
            second: Sub{ id: 2 },
            third: Sub{ id: 3 },
        };
    }
}

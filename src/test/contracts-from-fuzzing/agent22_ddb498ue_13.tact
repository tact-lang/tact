struct A {
    valueA: Int;
}

struct B {
    valueB: Int;
}

struct Combined {
    first: A;
    second: B;
}

contract TestContract {
    combined: Combined;

    init() {
        self.combined = Combined{
            first: A{ valueA: 5 },
            second: B{ valueB: 10 }
        };
    }
}
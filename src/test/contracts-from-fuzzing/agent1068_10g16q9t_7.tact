struct A {
    flag: Bool;
    maybeB: B?;
}

struct B {
    count: Int;
    maybeC: C?;
}

struct C {
    label: String;
    number: Int;
}

contract TestContract {
    val: A;

    init() {
        self.val = A{
            flag: true,
            maybeB: B{
                count: 5,
                maybeC: null,
            },
        };
    }

    receive() {
        self.val = self.val;
    }
}

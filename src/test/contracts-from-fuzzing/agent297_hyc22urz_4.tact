struct Nested1 {
    n2: Nested2;
}

struct Nested2 {
    n3: Nested3;
}

struct Nested3 {
    n4: Nested4;
}

struct Nested4 {
    n5: Int;
}

contract TestContract {
    val: Nested1;

    init() {
        self.val = Nested1{ n2: Nested2{ n3: Nested3{ n4: Nested4{ n5: 42 } } } };
    }
}
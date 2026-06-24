struct Nest1 { n1: Int; }
struct Nest2 { n2: Nest1; }
struct Nest3 { n3: Nest2; }
struct Nest4 { n4: Nest3; }
struct Nest5 { n5: Nest4; }

contract DeepTest {
    deep: Nest5;

    init() {
        self.deep = Nest5{ n5: Nest4{ n4: Nest3{ n3: Nest2{ n2: Nest1{ n1: 123 } } } } };
    }
}
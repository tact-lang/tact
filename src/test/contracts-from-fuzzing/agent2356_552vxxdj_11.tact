struct Nest1 { x: Int; }
struct Nest2 { n1: Nest1; }
struct Nest3 { n2: Nest2; }
struct Nest4 { n3: Nest3; }
struct Nest5 { n4: Nest4; }

contract DeepChain {
    val: Nest5;

    init() {
        self.val = Nest5{ n4: Nest4{ n3: Nest3{ n2: Nest2{ n1: Nest1{ x: 99 } } } } };
    }
}
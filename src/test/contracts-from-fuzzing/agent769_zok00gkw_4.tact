struct DeepNest3 {
    val: Int;
}

struct DeepNest2 {
    next: DeepNest3;
}

struct DeepNest1 {
    next: DeepNest2;
}

contract NestTest {
    root: DeepNest1;

    init() {
        self.root = DeepNest1{
            next: DeepNest2{
                next: DeepNest3{
                    val: 7,
                },
            },
        };
    }

    receive() {
        let _ = self.root.next.next.val + 1;
    }
}
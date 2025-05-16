struct Chain1 { val: Int; }
struct Chain2 { next: Chain1; val2: Int; }
struct Chain3 { next: Chain2; val3: Int; }

contract TestContract {
    linked: Chain3;

    init() {
        self.linked = Chain3{
            next: Chain2{
                next: Chain1{ val: 42 },
                val2: 43,
            },
            val3: 44,
        };
    }
}
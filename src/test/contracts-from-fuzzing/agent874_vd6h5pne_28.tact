// Very deep nested optional struct chain
struct N1 { next: N2? }
struct N2 { next: N3? }
struct N3 { next: N4? }
struct N4 { next: N5? }
struct N5 { val: Int }

contract DeepChainOpt {
    root: N1?;

    init() {
        self.root = N1 { next: N2 { next: N3 { next: N4 { next: N5 { val: 777 } } } } };
    }
}

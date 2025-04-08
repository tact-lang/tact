struct Deep1 { next: Int = 1; }
struct Deep2 { next: Deep1 = Deep1{}; }
struct Deep3 { next: Deep2 = Deep2{}; }
struct Deep4 { next: Deep3 = Deep3{}; }

contract TestContract {
    nested: Deep4 = Deep4{};
    init() {}
    receive() {}
}
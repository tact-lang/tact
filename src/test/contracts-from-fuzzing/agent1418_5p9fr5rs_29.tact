// deeply nested optional chain in a struct
struct Opt1 { val: Int?; }
struct Opt2 { next: Opt1?; }
struct Opt3 { next: Opt2?; }
struct Opt4 { next: Opt3?; }

contract DeepOptChain {
    root: Opt4?;

    init() {
        self.root = null;
    }
}
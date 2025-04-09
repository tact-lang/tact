struct RecursiveOpt1 {
    next: RecursiveOpt2?;
}

struct RecursiveOpt2 {
    next: RecursiveOpt3?;
}

struct RecursiveOpt3 {
    val: Int?;
}

contract Test {
    r: RecursiveOpt1;

    init() {
        self.r = RecursiveOpt1 { next: null };
    }
}
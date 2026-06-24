struct Chain5 {
    tail: Int?;
}
struct Chain4 {
    next: Chain5?;
}
struct Chain3 {
    next: Chain4?;
}
struct Chain2 {
    next: Chain3?;
}
struct Chain1 {
    next: Chain2?;
}

contract ChainOpt {
    data: Chain1;
    init() {
        self.data = Chain1{ next: null };
    }
}
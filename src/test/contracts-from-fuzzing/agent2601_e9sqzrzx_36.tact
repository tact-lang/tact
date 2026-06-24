struct Chain1 {
    f: Int?;
}
struct Chain2 {
    inner: Chain1?;
}
struct Chain3 {
    inner: Chain2?;
}
contract ChainOpts {
    nest: Chain3;
    init() {
        self.nest = Chain3{ inner: Chain2{ inner: Chain1{ f: null } } };
    }
}
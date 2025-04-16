struct OptLevel3 {
    val: Int?;
}
struct OptLevel2 {
    l3: OptLevel3?;
}
struct OptLevel1 {
    l2: OptLevel2?;
}

contract TestContract {
    nestedOpt: OptLevel1;

    init() {
        self.nestedOpt = OptLevel1{ l2: null };
    }
}
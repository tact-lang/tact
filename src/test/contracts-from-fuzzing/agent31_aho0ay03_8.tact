struct MultiOptionalLevel1 {
    data: MultiOptionalLevel2?;
}

struct MultiOptionalLevel2 {
    val: Int?;
}

contract TestContract {
    persist: MultiOptionalLevel1?;

    init() {
        self.persist = MultiOptionalLevel1{ data: null };
    }
}

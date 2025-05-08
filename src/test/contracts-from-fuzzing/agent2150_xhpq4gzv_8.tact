struct SParent {
    child1: Child1;
    child2: Child2;
}

struct Child1 {
    val1: Int;
    val2: Bool?;
    val3: String;
}

struct Child2 {
    val4: Address;
    val5: Cell?;
    val6: Slice;
}

contract TestContract {
    p: SParent;

    init() {
        self.p = SParent{
            child1: Child1{
                val1: 11,
                val2: null,
                val3: "hi"
            },
            child2: Child2{
                val4: myAddress(),
                val5: null,
                val6: emptyCell().asSlice()
            }
        };
    }
}
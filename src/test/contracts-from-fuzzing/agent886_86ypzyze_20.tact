// Large nested optional with many different types
struct VeryNestedOpt {
    x: Int?;
    y: Bool?;
    z: String?;
    addr: Address?;
    cell: Cell?;
    slice: Slice?;
}

struct Container {
    nested: VeryNestedOpt?;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            nested: VeryNestedOpt{
                x: null,
                y: true,
                z: "hi",
                addr: myAddress(),
                cell: emptyCell(),
                slice: emptyCell().asSlice()
            }
        };
    }
}

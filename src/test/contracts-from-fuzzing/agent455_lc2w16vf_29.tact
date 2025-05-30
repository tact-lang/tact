struct Layer1 {
    l2: Layer2;
}
struct Layer2 {
    l3: Layer3;
    b1: Bool;
}
struct Layer3 {
    l4: Layer4;
}
struct Layer4 {
    l5: Layer5?;
}
struct Layer5 {
    finalVal: Int;
}

contract NestedOptLayer {
    root: Layer1;

    init() {
        self.root = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{
                        l5: Layer5{finalVal: 17},
                    },
                },
                b1: false,
            },
        };
    }
}
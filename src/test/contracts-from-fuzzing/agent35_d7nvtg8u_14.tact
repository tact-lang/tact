struct Layer1 {
    a: Int;
    b: Bool;
}

struct Layer2 {
    l1: Layer1;
    s: String;
}

struct Layer3 {
    l2: Layer2;
    c: Cell;
}

struct Layer4 {
    l3: Layer3;
    a: Address;
}

contract DeepFour {
    data: Layer4;

    init() {
        self.data = Layer4{
            l3: Layer3{
                l2: Layer2{
                    l1: Layer1{a:1,b:true},
                    s:"hi"
                },
                c: emptyCell()
            },
            a: myAddress()
        };
    }
}
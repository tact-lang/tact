struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer4 {
    flag: Bool;
    note: String;
}

contract TestContract {
    chain: Layer1;

    init() {
        self.chain = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{
                        flag:true,
                        note:"deepest"
                    }
                }
            }
        };
    }
}

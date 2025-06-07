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
    l5: Layer5;
}

struct Layer5 {
    num: Int;
}

contract FiveLayers {
    top: Layer1;

    init() {
        self.top = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{
                        l5: Layer5{
                            num: 777
                        }
                    }
                }
            }
        };
    }
}
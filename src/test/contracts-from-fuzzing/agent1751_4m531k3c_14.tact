struct Layer4 { val: Int?; }
struct Layer3 { l4: Layer4?; text: String; }
struct Layer2 { l3: Layer3?; flag: Bool; }
struct Layer1 { l2: Layer2?; number: Int; }

contract DeepOptionalChain {
    storage: Layer1;

    init() {
        self.storage = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{ val: null },
                    text: "deep"
                },
                flag: true
            },
            number: 100
        };
    }

    receive() {}
}
// deeply nested many optionals, some null some not
struct Layer1{ val: Int?; }
struct Layer2{ l1: Layer1?; }
struct Layer3{ l2: Layer2?; }
struct Layer4{ l3: Layer3?; }
struct Layer5{ l4: Layer4?; }

contract DeepOptChain {
    data: Layer5;

    init() {
        self.data = Layer5{
            l4: Layer4{
                l3: null,
            },
        };
    }
}
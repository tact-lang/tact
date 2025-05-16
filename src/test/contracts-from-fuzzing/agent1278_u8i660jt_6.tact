struct Wrap1 { x: Int }
struct Wrap2 { wrap1: Wrap1 } 
struct Wrap3 { wrap2: Wrap2 } 

contract DeepWrap {
    data: Wrap3;

    init() {
        self.data = Wrap3{ wrap2: Wrap2{ wrap1: Wrap1{ x: 42 } } };
    }
}
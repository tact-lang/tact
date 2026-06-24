struct Layer4 {
    value: Int;
}
struct Layer3 {
    next: Layer4;
}
struct Layer2 {
    next: Layer3;
}
struct Layer1 {
    next: Layer2;
}

contract ChainContract {
    chainData: Layer1;

    init() {
        self.chainData = Layer1{
            next: Layer2{
                next: Layer3{
                    next: Layer4{value: 100}
                }
            }
        };
    }
}
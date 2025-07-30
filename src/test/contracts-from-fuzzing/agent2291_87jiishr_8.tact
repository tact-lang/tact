struct Layer1 {
    a: Int?;
}
struct Layer2 {
    b: Layer1?;
}
struct Layer3 {
    c: Layer2?;
}

contract DeepOptionals {
    d: Layer3?;

    init() {
        self.d = Layer3{
            c: Layer2{
                b: Layer1{
                    a: 99
                }
            }
        };
    }
}

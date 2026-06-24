struct BoolChain1 {
    x: Bool;
}
struct BoolChain2 {
    y: BoolChain1;
}
struct BoolChain3 {
    z: BoolChain2;
}

contract TestC {
    data: BoolChain3;

    init() {
        self.data = BoolChain3{
            z: BoolChain2{
                y: BoolChain1{
                    x: true
                }
            }
        };
    }
}
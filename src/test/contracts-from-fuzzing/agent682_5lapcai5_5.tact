struct DeepDeeperDeepest {
    x: Int;
    nest: Nest1;
}
struct Nest1 {
    y: Int?;
    nest2: Nest2;
}
struct Nest2 {
    z: String?;
}

contract TestContract {
    d: DeepDeeperDeepest;

    init() {
        self.d = DeepDeeperDeepest{
            x: 1,
            nest: Nest1{
                y: null,
                nest2: Nest2{
                    z: "hello"
                }
            }
        };
    }
}
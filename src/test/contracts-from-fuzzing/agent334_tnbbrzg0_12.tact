struct MultiOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}
struct Container {
    m: MultiOptional?;
}
contract Test {
    dat: Container;

    init() {
        self.dat = Container{
            m: MultiOptional{ x: 1, y: null, z: "hi" }
        };
    }
}
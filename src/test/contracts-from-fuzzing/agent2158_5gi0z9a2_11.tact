struct StructDefaultOpt {
    x: Int?;
    y: Bool = false;
    msg: String = "hi";
}

contract StructDefaultsTest {
    data: StructDefaultOpt;
    
    init() {
        self.data = StructDefaultOpt{ x: null };
    }
}
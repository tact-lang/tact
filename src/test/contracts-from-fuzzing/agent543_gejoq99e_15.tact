struct Params {
    x: Int = 5;
    y: Int?;
    z: Bool = true;
}

contract DefaultsTest {
    p: Params;

    init() {
        self.p = Params{z:false, y:null};
    }
}
